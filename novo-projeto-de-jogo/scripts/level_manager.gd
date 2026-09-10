class_name LevelManager
extends Node2D

signal level_completed(level_dict: Dictionary, steps: int)

@export var hud: SokoHUD
@export var victory_modal: SokoVictoryModal
@export var grade_modal: CanvasLayer
@export var pedagogical_modal: SokoPedagogicalModal
@export var accessibility_modal: SokoAccessibilityModal

var current_grade: int = 1
var current_level_index: int = 0
var current_level: Dictionary = {}

var walls_set: Dictionary = {} # Vector2i -> bool
var boxes: Array[SokoBox] = []
var plates: Array[SokoPlate] = []
var player: SokoPlayer = null

var door_pos: Vector2i = Vector2i(-999, -999)
var door_sprite: Sprite2D = null
var arrow_sprite: Sprite2D = null
var arrow_tween: Tween = null
var is_door_open: bool = false
var is_completed: bool = false

var step_count: int = 0
var history_stack: Array[Dictionary] = []

# Mobile / Responsiveness / Accessibility state
var is_swipe_enabled: bool = true
var is_high_contrast: bool = false
var _touch_start_pos: Vector2 = Vector2.ZERO
var _is_touching: bool = false
const SWIPE_THRESHOLD: float = 35.0

# Node containers
@onready var ground_container: Node2D = $GroundContainer
@onready var walls_container: Node2D = $WallsContainer
@onready var plates_container: Node2D = $PlatesContainer
@onready var boxes_container: Node2D = $BoxesContainer
@onready var entities_container: Node2D = $EntitiesContainer

# Preloads
const BOX_SCENE: PackedScene = preload("res://scenes/entities/box.tscn")
const PLATE_SCENE: PackedScene = preload("res://scenes/entities/plate.tscn")
const PLAYER_SCENE: PackedScene = preload("res://scenes/entities/player.tscn")

const TEX_GROUND := "res://kenney_sokoban-pack/PNG/Default size/Ground/ground_05.png"
const TEX_WALL := "res://kenney_sokoban-pack/PNG/Default size/Blocks/block_02.png"
const TEX_DOOR_CLOSED := "res://assets/door_closed.png"
const TEX_DOOR_OPEN := "res://assets/door_open.png"
const TEX_ARROW := "res://assets/exit_arrow.png"

func _ready() -> void:
	if hud:
		hud.undo_pressed.connect(undo_step)
		hud.restart_pressed.connect(restart_current_level)
		hud.prev_level_pressed.connect(load_prev_level)
		hud.next_level_pressed.connect(load_next_level)
		hud.change_grade_pressed.connect(open_grade_modal)
		hud.pedagogical_pressed.connect(open_pedagogical_modal)
		hud.accessibility_pressed.connect(open_accessibility_modal)
		hud.dpad_direction_pressed.connect(request_move)
	if victory_modal:
		victory_modal.next_level_selected.connect(load_next_level)
		victory_modal.retry_level_selected.connect(restart_current_level)
	if grade_modal:
		grade_modal.grade_and_level_selected.connect(on_grade_and_level_selected)
		grade_modal.closed.connect(func():
			if current_level.is_empty():
				load_grade_level(1, 0)
		)
	if accessibility_modal:
		accessibility_modal.virtual_dpad_changed.connect(func(enabled: bool):
			if hud:
				hud.set_virtual_dpad_visible(enabled)
		)
		accessibility_modal.large_text_changed.connect(func(enabled: bool):
			if hud:
				hud.set_large_text_mode(enabled)
		)
		accessibility_modal.swipe_gestures_changed.connect(func(enabled: bool):
			is_swipe_enabled = enabled
		)
		accessibility_modal.high_contrast_changed.connect(set_high_contrast_mode)

	get_tree().root.size_changed.connect(_center_camera_or_level)

	# Carrega nível inicial
	load_grade_level(1, 0)

	# Exibe o modal pedagógico de escolha de ano antes de começar
	if grade_modal:
		grade_modal.open(current_grade)

func open_grade_modal() -> void:
	if grade_modal:
		grade_modal.open(current_grade)

func open_pedagogical_modal() -> void:
	if pedagogical_modal:
		pedagogical_modal.open()

func open_accessibility_modal() -> void:
	if accessibility_modal:
		accessibility_modal.open()

func set_high_contrast_mode(enabled: bool) -> void:
	is_high_contrast = enabled
	for b in boxes:
		if b and is_instance_valid(b):
			b.modulate = Color(1.3, 1.3, 1.3) if enabled else Color.WHITE
	for p in plates:
		if p and is_instance_valid(p) and p.tag_badge:
			p.tag_badge.modulate = Color(1.5, 1.5, 0.8) if enabled else Color.WHITE

func on_grade_and_level_selected(grade: int, lvl_idx: int) -> void:
	load_grade_level(grade, lvl_idx)

func _unhandled_input(event: InputEvent) -> void:
	if is_completed:
		return

	if event.is_action_pressed("ui_cancel"):
		return

	if event is InputEventKey and event.pressed and not event.echo:
		match event.keycode:
			KEY_M, KEY_TAB:
				open_grade_modal()
				return
			KEY_Z:
				undo_step()
				return
			KEY_R:
				restart_current_level()
				return
			KEY_1:
				load_grade_level(current_grade, 0)
				return
			KEY_2:
				load_grade_level(current_grade, 1)
				return
			KEY_3:
				load_grade_level(current_grade, 2)
				return
			KEY_4:
				load_grade_level(current_grade, 3)
				return
			KEY_5:
				load_grade_level(current_grade, 4)
				return
			KEY_W, KEY_UP:
				request_move(Vector2i.UP)
				return
			KEY_S, KEY_DOWN:
				request_move(Vector2i.DOWN)
				return
			KEY_A, KEY_LEFT:
				request_move(Vector2i.LEFT)
				return
			KEY_D, KEY_RIGHT:
				request_move(Vector2i.RIGHT)
				return

	if is_swipe_enabled:
		if event is InputEventScreenTouch:
			if event.pressed:
				_touch_start_pos = event.position
				_is_touching = true
			else:
				if _is_touching:
					_handle_swipe(event.position)
				_is_touching = false
		elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				_touch_start_pos = event.position
				_is_touching = true
			else:
				if _is_touching:
					_handle_swipe(event.position)
				_is_touching = false

func _handle_swipe(end_pos: Vector2) -> void:
	var delta := end_pos - _touch_start_pos
	if delta.length() < SWIPE_THRESHOLD:
		return
	if absf(delta.x) > absf(delta.y):
		if delta.x > 0:
			request_move(Vector2i.RIGHT)
		else:
			request_move(Vector2i.LEFT)
	else:
		if delta.y > 0:
			request_move(Vector2i.DOWN)
		else:
			request_move(Vector2i.UP)

func load_level(idx: int) -> void:
	load_grade_level(current_grade, idx)

func load_grade_level(grade: int, idx: int) -> void:
	current_grade = clampi(grade, 1, 5)
	var total_levels := LevelData.get_level_count(current_grade)
	if idx < 0 or idx >= total_levels:
		idx = 0
	current_level_index = idx
	current_level = LevelData.get_level_instance(current_grade, current_level_index)
	is_completed = false
	is_door_open = false
	step_count = 0
	history_stack.clear()
	get_viewport().gui_release_focus()

	_clear_containers()
	_build_level_geometry()
	_spawn_entities()
	_center_camera_or_level()

	if hud:
		hud.update_level_info(current_level)
		hud.update_steps(step_count, current_level.get("optimal_steps", 15))

	_evaluate_game_state()

func _clear_containers() -> void:
	walls_set.clear()
	boxes.clear()
	plates.clear()
	player = null
	door_sprite = null
	if arrow_tween and arrow_tween.is_valid():
		arrow_tween.kill()
	arrow_tween = null
	arrow_sprite = null

	for child in ground_container.get_children():
		child.queue_free()
	for child in walls_container.get_children():
		child.queue_free()
	for child in plates_container.get_children():
		child.queue_free()
	for child in boxes_container.get_children():
		child.queue_free()
	for child in entities_container.get_children():
		child.queue_free()

func _build_level_geometry() -> void:
	var w: int = current_level.get("grid_width", 10)
	var h: int = current_level.get("grid_height", 8)
	var ground_tex = load(TEX_GROUND)
	var wall_tex = load(TEX_WALL)

	# Build floors for all inner cells
	for x in range(w):
		for y in range(h):
			var pos := Vector2i(x, y)
			var spr := Sprite2D.new()
			spr.texture = ground_tex
			spr.position = GridConstants.grid_to_world(pos) + Vector2(32, 32)
			ground_container.add_child(spr)

	# Build walls
	var walls_arr: Array = current_level.get("walls", [])
	for wall_v in walls_arr:
		var pos: Vector2i = wall_v
		walls_set[pos] = true
		var spr := Sprite2D.new()
		spr.texture = wall_tex
		spr.position = GridConstants.grid_to_world(pos) + Vector2(32, 32)
		walls_container.add_child(spr)

	# Build door
	door_pos = current_level.get("door_pos", Vector2i(-999, -999))
	if door_pos != Vector2i(-999, -999):
		door_sprite = Sprite2D.new()
		door_sprite.texture = load(TEX_DOOR_CLOSED)
		door_sprite.position = GridConstants.grid_to_world(door_pos) + Vector2(32, 32)
		walls_container.add_child(door_sprite)

		# Build pulsing exit arrow (starts hidden until door opens)
		arrow_sprite = Sprite2D.new()
		arrow_sprite.texture = load(TEX_ARROW)
		arrow_sprite.visible = false
		arrow_sprite.z_index = 6
		entities_container.add_child(arrow_sprite)

func _spawn_entities() -> void:
	# Plates
	var plates_data: Array = current_level.get("plates", [])
	for p_data in plates_data:
		var plate_node: SokoPlate = PLATE_SCENE.instantiate()
		plates_container.add_child(plate_node)
		plate_node.setup(
			p_data.get("pos", Vector2i.ZERO),
			p_data.get("type", SokoPlate.ConditionType.ANY_VALUE),
			p_data.get("val", 0),
			p_data.get("label", ""),
			p_data.get("id", "")
		)
		plates.append(plate_node)

	# Boxes
	var crates_data: Array = current_level.get("crates", [])
	for c_data in crates_data:
		var box_node: SokoBox = BOX_SCENE.instantiate()
		boxes_container.add_child(box_node)
		box_node.setup(
			c_data.get("pos", Vector2i.ZERO),
			c_data.get("val", 1),
			c_data.get("theme", "wood")
		)
		boxes.append(box_node)

	# Player
	var p_start: Vector2i = current_level.get("player_start", Vector2i(1, 1))
	player = PLAYER_SCENE.instantiate()
	entities_container.add_child(player)
	player.setup(p_start)

func _center_camera_or_level() -> void:
	if current_level.is_empty():
		return
	var w: int = current_level.get("grid_width", 10)
	var h: int = current_level.get("grid_height", 8)
	var total_w := float(w * GridConstants.TILE_SIZE)
	var total_h := float(h * GridConstants.TILE_SIZE)

	var vp_size: Vector2 = get_viewport_rect().size
	var screen_w: float = vp_size.x
	var screen_h: float = vp_size.y
	var is_portrait: bool = screen_h > screen_w

	# Altura ocupada pela TopBar + ObjectivePanel + margem de segurança
	var top_ui_h: float = 162.0

	var fit_scale: float = 1.0
	var origin_x: float = 0.0
	var origin_y: float = 0.0

	if is_portrait:
		# Modo Vertical (Mobile Portrait):
		# Ajusta o jogo para os cantos da tela (máxima largura disponível),
		# respeitando a área inferior reservada para os controles de toque (D-Pad).
		var margin_x := 16.0
		var target_scale_w := maxf((screen_w - margin_x) / total_w, 0.2)
		var dpad_reserved_h := 220.0
		var max_board_h := maxf(screen_h - top_ui_h - dpad_reserved_h, 120.0)
		var max_scale_h := max_board_h / total_h

		fit_scale = minf(target_scale_w, max_scale_h)
		var scaled_w := total_w * fit_scale
		origin_x = (screen_w - scaled_w) / 2.0
		origin_y = top_ui_h + 8.0
	else:
		# Modo Horizontal (Desktop / Mobile Landscape):
		# Ajusta o jogo do topo ao rodapé da área útil ("topo e rodape"),
		# maximizando a escala vertical sem estourar as laterais.
		var bottom_margin := 14.0
		var available_h := maxf(screen_h - top_ui_h - bottom_margin, 120.0)
		var target_scale_h := available_h / total_h
		var available_w := maxf(screen_w - 40.0, 120.0)
		var target_scale_w := available_w / total_w

		fit_scale = minf(target_scale_h, target_scale_w)
		var scaled_w := total_w * fit_scale
		var scaled_h := total_h * fit_scale
		origin_x = (screen_w - scaled_w) / 2.0
		origin_y = top_ui_h + (available_h - scaled_h) / 2.0

	fit_scale = maxf(fit_scale, 0.25)
	scale = Vector2(fit_scale, fit_scale)
	position = Vector2(origin_x, origin_y)

func get_box_at(coord: Vector2i) -> SokoBox:
	for b in boxes:
		if b.grid_pos == coord:
			return b
	return null

func get_plate_at(coord: Vector2i) -> SokoPlate:
	for p in plates:
		if p.grid_pos == coord:
			return p
	return null

func is_walkable(coord: Vector2i) -> bool:
	if walls_set.has(coord):
		return false
	if coord == door_pos and not is_door_open:
		return false
	return true

func request_move(dir: Vector2i) -> void:
	if player == null or player.is_moving or is_completed:
		return

	var target_coord := player.grid_pos + dir

	# Check door win condition if walking into open door
	if target_coord == door_pos and is_door_open:
		_record_snapshot()
		player.move_to(target_coord, false, 0.15)
		_trigger_victory()
		return

	if not is_walkable(target_coord):
		player.set_facing(dir, false)
		return

	var box_at_target := get_box_at(target_coord)
	if box_at_target != null:
		var beyond_box := target_coord + dir
		if not is_walkable(beyond_box) or get_box_at(beyond_box) != null:
			# Box is blocked
			player.set_facing(dir, true)
			return

		# Can push box!
		_record_snapshot()
		step_count += 1
		box_at_target.move_to(beyond_box, 0.15)
		player.move_to(target_coord, true, 0.15)
		SoundManager.play("push", 0.08)

		# Wait for move tween to update plates and state
		get_tree().create_timer(0.16).timeout.connect(func():
			_evaluate_game_state()
		)
	else:
		# Free walk
		_record_snapshot()
		step_count += 1
		player.move_to(target_coord, false, 0.15)
		SoundManager.play("step", 0.08)

	if hud:
		hud.update_steps(step_count, current_level.get("optimal_steps", 15))

func _record_snapshot() -> void:
	var snapshot: Dictionary = {
		"player_pos": player.grid_pos,
		"player_facing": player.current_facing,
		"boxes": []
	}
	for b in boxes:
		snapshot["boxes"].append({
			"box": b,
			"pos": b.grid_pos
		})
	history_stack.append(snapshot)

func undo_step() -> void:
	if history_stack.is_empty() or player == null or player.is_moving or is_completed:
		return

	var last_state: Dictionary = history_stack.pop_back()
	player.jump_to(last_state.get("player_pos", player.grid_pos))
	player.set_facing(last_state.get("player_facing", Vector2i.DOWN), false)

	for b_info in last_state.get("boxes", []):
		var b: SokoBox = b_info["box"]
		if is_instance_valid(b):
			b.grid_pos = b_info["pos"]
			b.position = GridConstants.grid_to_world(b.grid_pos) + Vector2(32, 32)

	if step_count > 0:
		step_count -= 1

	SoundManager.play("undo", 0.05)

	if hud:
		hud.update_steps(step_count, current_level.get("optimal_steps", 15))

	_evaluate_game_state()

func restart_current_level() -> void:
	load_grade_level(current_grade, current_level_index)

func load_prev_level() -> void:
	var total_levels := LevelData.get_level_count(current_grade)
	var prev_idx := current_level_index - 1
	if prev_idx < 0:
		prev_idx = total_levels - 1
	load_grade_level(current_grade, prev_idx)

func load_next_level() -> void:
	var total_levels := LevelData.get_level_count(current_grade)
	var next_idx := current_level_index + 1
	if next_idx >= total_levels:
		if current_grade < 5:
			load_grade_level(current_grade + 1, 0)
		else:
			open_grade_modal()
	else:
		load_grade_level(current_grade, next_idx)

func _evaluate_game_state() -> void:
	# Update all plates with boxes currently on them
	for plate in plates:
		var b := get_box_at(plate.grid_pos)
		plate.evaluate_box(b)

	var rule_type: String = current_level.get("rule_type", "")
	var target_val: int = current_level.get("target_value", 0)
	var satisfied := false
	var status_text := ""

	match rule_type:
		"TARGET_PLATES":
			var all_ok := true
			var active_count := 0
			for p in plates:
				if p.is_satisfied:
					active_count += 1
				else:
					all_ok = false
			status_text = "Sensores Ativados: %d / %d" % [active_count, plates.size()]
			satisfied = all_ok

		"ORDER_ASCENDING":
			var all_ok := true
			var parts: Array[String] = []
			for p in plates:
				var b := get_box_at(p.grid_pos)
				if b:
					parts.append(str(b.value) + (" [OK]" if p.is_satisfied else " [X]"))
				else:
					parts.append("?")
				if not p.is_satisfied:
					all_ok = false
			status_text = "Ordem: " + " -> ".join(parts)
			satisfied = all_ok

		"MINIMUM_VALUE":
			var p_ok := plates.size() > 0 and plates[0].is_satisfied
			var b := get_box_at(plates[0].grid_pos) if plates.size() > 0 else null
			var b_str := str(b.value) if b else "?"
			status_text = "Caixa no Sensor: [%s] (%s)" % [b_str, "Menor Valor Correto!" if p_ok else "Aguardando o menor número"]
			satisfied = p_ok

		"CONDITION_SINGLE":
			var p_ok := plates.size() > 0 and plates[0].is_satisfied
			var b := get_box_at(plates[0].grid_pos) if plates.size() > 0 else null
			var b_str := str(b.value) if b else "?"
			status_text = "Condição do Sensor: [%s] (%s)" % [b_str, "Ativada" if p_ok else "Pendente"]
			satisfied = p_ok

		"CONDITIONAL_EVEN_ODD":
			var p1_ok := plates.size() > 0 and plates[0].is_satisfied
			var p2_ok := plates.size() > 1 and plates[1].is_satisfied
			var b1 := get_box_at(plates[0].grid_pos) if plates.size() > 0 else null
			var b2 := get_box_at(plates[1].grid_pos) if plates.size() > 1 else null
			var t1 := (str(b1.value) + " [OK]") if p1_ok else (str(b1.value) + " [X]") if b1 else "?"
			var t2 := (str(b2.value) + " [OK]") if p2_ok else (str(b2.value) + " [X]") if b2 else "?"
			status_text = "PAR: [%s] | ÍMPAR: [%s]" % [t1, t2]
			satisfied = (p1_ok and p2_ok)

		"SUM_EQUALS":
			var current_sum := 0
			var filled_count := 0
			var terms: Array[String] = []
			for plate in plates:
				var b := get_box_at(plate.grid_pos)
				if b:
					current_sum += b.value
					filled_count += 1
					terms.append(str(b.value))
				else:
					terms.append("?")
			status_text = "Cálculo: " + " + ".join(terms) + " = %d / Meta: %d" % [current_sum, target_val]
			satisfied = (filled_count == plates.size() and current_sum == target_val)

		"CONDITIONAL_DUAL":
			var p1_ok := plates.size() > 0 and plates[0].is_satisfied
			var p2_ok := plates.size() > 1 and plates[1].is_satisfied
			var p1_box := get_box_at(plates[0].grid_pos) if plates.size() > 0 else null
			var p2_box := get_box_at(plates[1].grid_pos) if plates.size() > 1 else null

			var p1_txt: String = (str(p1_box.value) + " [OK]") if p1_ok else (str(p1_box.value) + " [X]") if p1_box else "?"
			var p2_txt: String = (str(p2_box.value) + " [OK]") if p2_ok else (str(p2_box.value) + " [X]") if p2_box else "?"
			status_text = "IF PAR: [%s] | IF > %d: [%s]" % [p1_txt, target_val, p2_txt]
			satisfied = (p1_ok and p2_ok)

		"LOGIC_CIRCUIT":
			var in1_box := get_box_at(plates[0].grid_pos) if plates.size() > 0 else null
			var in2_box := get_box_at(plates[1].grid_pos) if plates.size() > 1 else null

			var v1 := in1_box.value if in1_box else 0
			var v2 := in2_box.value if in2_box else 0
			var and_result := 1 if (v1 == 1 and v2 == 1) else 0

			status_text = "Circuito AND: In1=%s, In2=%s -> Saída: %d (%s)" % [
				str(v1) if in1_box else "?",
				str(v2) if in2_box else "?",
				and_result,
				"ATIVA" if and_result == 1 else "BLOQUEADA"
			]
			satisfied = (and_result == 1)

		"EQUATION_2A_PLUS_B":
			var bA := get_box_at(plates[0].grid_pos) if plates.size() > 0 else null
			var bB := get_box_at(plates[1].grid_pos) if plates.size() > 1 else null

			var valA := bA.value if bA else 0
			var valB := bB.value if bB else 0
			var eq_result := 2 * valA + valB

			status_text = "Equação: 2 * [%s] + [%s] = %d / Meta: %d" % [
				str(valA) if bA else "?",
				str(valB) if bB else "?",
				eq_result if (bA and bB) else 0,
				target_val
			]
			satisfied = (bA != null and bB != null and eq_result == target_val)

		"SEQUENCE_PA":
			var all_plates_ok := true
			for p in plates:
				if not p.is_satisfied:
					all_plates_ok = false
					break
			var b3 := get_box_at(plates[0].grid_pos) if plates.size() > 0 else null
			var b4 := get_box_at(plates[1].grid_pos) if plates.size() > 1 else null
			var seq_start: Array = current_level.get("seq_start", [2, 5])
			var seq_op: String = current_level.get("seq_op", "+%d" % target_val)
			status_text = "Sequência (%s): %s -> %s -> [%s] -> [%s]" % [
				seq_op,
				str(seq_start[0]),
				str(seq_start[1]),
				str(b3.value) if b3 else "?",
				str(b4.value) if b4 else "?"
			]
			satisfied = all_plates_ok

		"SUBTRACTION":
			var bA := get_box_at(plates[0].grid_pos) if plates.size() > 0 else null
			var bB := get_box_at(plates[1].grid_pos) if plates.size() > 1 else null
			var valA := bA.value if bA else 0
			var valB := bB.value if bB else 0
			var diff := valA - valB
			status_text = "Subtração: [%s] - [%s] = %d / Meta: %d" % [
				str(valA) if bA else "?",
				str(valB) if bB else "?",
				diff if (bA and bB) else 0,
				target_val
			]
			satisfied = (bA != null and bB != null and diff == target_val)

		"MULTIPLICATION":
			var bA := get_box_at(plates[0].grid_pos) if plates.size() > 0 else null
			var bB := get_box_at(plates[1].grid_pos) if plates.size() > 1 else null
			var valA := bA.value if bA else 0
			var valB := bB.value if bB else 0
			var prod := valA * valB
			status_text = "Multiplicação: [%s] * [%s] = %d / Meta: %d" % [
				str(valA) if bA else "?",
				str(valB) if bB else "?",
				prod if (bA and bB) else 0,
				target_val
			]
			satisfied = (bA != null and bB != null and prod == target_val)

		"DIVISIBILITY":
			var all_div := true
			var count_filled := 0
			var txts: Array[String] = []
			for p in plates:
				var b := get_box_at(p.grid_pos)
				if b:
					count_filled += 1
					var is_div := (b.value % target_val == 0)
					txts.append("%d (%s)" % [b.value, "OK" if is_div else "X"])
					if not is_div:
						all_div = false
				else:
					txts.append("?")
					all_div = false
			status_text = "Múltiplos de %d: [%s]" % [target_val, " | ".join(txts)]
			satisfied = (count_filled == plates.size() and all_div)

		"AVERAGE_3":
			var sum_v := 0
			var count_v := 0
			var txts: Array[String] = []
			for p in plates:
				var b := get_box_at(p.grid_pos)
				if b:
					sum_v += b.value
					count_v += 1
					txts.append(str(b.value))
				else:
					txts.append("?")
			var avg_calc: float = float(sum_v) / 3.0 if count_v == 3 else 0.0
			status_text = "Média: (%s) / 3 = %.1f / Meta: %d" % [" + ".join(txts), avg_calc, target_val]
			satisfied = (count_v == 3 and sum_v == target_val * 3)

		"EXPRESSION_COMPOUND":
			var bA := get_box_at(plates[0].grid_pos) if plates.size() > 0 else null
			var bB := get_box_at(plates[1].grid_pos) if plates.size() > 1 else null
			var bC := get_box_at(plates[2].grid_pos) if plates.size() > 2 else null
			var vA := bA.value if bA else 0
			var vB := bB.value if bB else 0
			var vC := bC.value if bC else 0
			var res := (vA + vB) * vC
			status_text = "Expressão: ([%s] + [%s]) * [%s] = %d / Meta: %d" % [
				str(vA) if bA else "?",
				str(vB) if bB else "?",
				str(vC) if bC else "?",
				res if (bA and bB and bC) else 0,
				target_val
			]
			satisfied = (bA != null and bB != null and bC != null and res == target_val)

	if hud:
		hud.update_math_status(status_text, satisfied)

	if satisfied and not is_door_open:
		_open_door()
	elif not satisfied and is_door_open:
		_close_door()

func _open_door() -> void:
	is_door_open = true
	SoundManager.play("plate", 0.05)
	if door_sprite:
		door_sprite.texture = load(TEX_DOOR_OPEN)
		var tween = create_tween()
		tween.tween_property(door_sprite, "scale", Vector2(1.2, 1.2), 0.15)
		tween.tween_property(door_sprite, "scale", Vector2(1.0, 1.0), 0.15)
	_show_and_pulse_exit_arrow()

func _close_door() -> void:
	is_door_open = false
	if door_sprite:
		door_sprite.texture = load(TEX_DOOR_CLOSED)
	if arrow_sprite:
		arrow_sprite.visible = false
	if arrow_tween and arrow_tween.is_valid():
		arrow_tween.kill()
		arrow_tween = null

func _show_and_pulse_exit_arrow() -> void:
	if not arrow_sprite or door_pos == Vector2i(-999, -999):
		return

	var w: int = current_level.get("grid_width", 10)
	var h: int = current_level.get("grid_height", 8)
	var from_cell: Vector2i = door_pos + Vector2i.LEFT
	var candidate_dirs: Array[Vector2i] = [Vector2i.LEFT, Vector2i.DOWN, Vector2i.UP, Vector2i.RIGHT]
	for dir: Vector2i in candidate_dirs:
		var cand: Vector2i = door_pos + dir
		if cand.x >= 0 and cand.x < w and cand.y >= 0 and cand.y < h and not walls_set.has(cand):
			from_cell = cand
			break

	var to_dir := Vector2(door_pos - from_cell)
	var base_pos: Vector2 = GridConstants.grid_to_world(from_cell) + Vector2(32, 32)
	arrow_sprite.position = base_pos
	arrow_sprite.rotation = to_dir.angle()
	arrow_sprite.scale = Vector2.ONE
	arrow_sprite.visible = true

	if arrow_tween and arrow_tween.is_valid():
		arrow_tween.kill()

	arrow_tween = create_tween().set_loops()
	var pulse_offset: Vector2 = to_dir.normalized() * 12.0
	arrow_tween.tween_property(arrow_sprite, "position", base_pos + pulse_offset, 0.4).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	arrow_tween.parallel().tween_property(arrow_sprite, "scale", Vector2(1.25, 1.25), 0.4).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	arrow_tween.tween_property(arrow_sprite, "position", base_pos, 0.4).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	arrow_tween.parallel().tween_property(arrow_sprite, "scale", Vector2(1.0, 1.0), 0.4).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)

func _trigger_victory() -> void:
	if is_completed:
		return
	is_completed = true
	SoundManager.play("win")
	var is_final_grade_level := (current_level_index == LevelData.get_level_count(current_grade) - 1)
	if victory_modal:
		victory_modal.show_victory(current_level, step_count, is_final_grade_level, current_grade)
	level_completed.emit(current_level, step_count)
