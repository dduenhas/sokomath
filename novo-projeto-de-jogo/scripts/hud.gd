class_name SokoHUD
extends CanvasLayer

signal undo_pressed
signal restart_pressed
signal prev_level_pressed
signal next_level_pressed
signal change_grade_pressed
signal pedagogical_pressed
signal accessibility_pressed
signal dpad_direction_pressed(dir: Vector2i)

@onready var title_label: Label = $TopBar/MarginContainer/VBoxContainer/Row1/Title
@onready var steps_label: Label = $TopBar/MarginContainer/VBoxContainer/Row1/StepsBadge/Margin/StepsLabel
@onready var music_button: Button = $TopBar/MarginContainer/VBoxContainer/Row1/MusicBtn
@onready var sfx_button: Button = $TopBar/MarginContainer/VBoxContainer/Row1/SfxBtn
@onready var access_button: Button = $TopBar/MarginContainer/VBoxContainer/Row1/AccessBtn
@onready var fullscreen_button: Button = $TopBar/MarginContainer/VBoxContainer/Row1/FullscreenBtn

# Action Buttons in TopBar Row2
@onready var grade_button: Button = $TopBar/MarginContainer/VBoxContainer/Row2/GradeBtn
@onready var prev_button: Button = $TopBar/MarginContainer/VBoxContainer/Row2/PrevBtn
@onready var next_button: Button = $TopBar/MarginContainer/VBoxContainer/Row2/NextBtn
@onready var undo_button: Button = $TopBar/MarginContainer/VBoxContainer/Row2/UndoBtn
@onready var restart_button: Button = $TopBar/MarginContainer/VBoxContainer/Row2/RestartBtn
@onready var toggle_bncc_button: Button = $TopBar/MarginContainer/VBoxContainer/Row2/ToggleBNCCBtn
@onready var owl_button: Button = $TopBar/MarginContainer/VBoxContainer/Row2/OwlBtn

# Objective Panel
@onready var objective_panel: PanelContainer = $ObjectivePanel
@onready var objective_label: Label = $ObjectivePanel/Margin/VBox/ObjectiveText
@onready var math_status_label: Label = $ObjectivePanel/Margin/VBox/MathStatus

# Floating Didactic / BNCC Dialogue Modal
@onready var bncc_modal: Control = $BNCCFloatingModal
@onready var bncc_card: PanelContainer = $BNCCFloatingModal/Card
@onready var bncc_code_label: Label = $BNCCFloatingModal/Card/Margin/VBox/Header/BNCCCode
@onready var bncc_desc_label: Label = $BNCCFloatingModal/Card/Margin/VBox/BNCCDesc
@onready var close_bncc_btn: Button = $BNCCFloatingModal/Card/Margin/VBox/Header/CloseBtn
@onready var dismiss_bncc_btn: Button = $BNCCFloatingModal/Card/Margin/VBox/DismissBtn

# Virtual D-Pad (Touch / Mobile)
@onready var virtual_dpad: Control = $VirtualDPad
@onready var up_btn: Button = $VirtualDPad/UpBtn
@onready var down_btn: Button = $VirtualDPad/DownBtn
@onready var left_btn: Button = $VirtualDPad/LeftBtn
@onready var right_btn: Button = $VirtualDPad/RightBtn
@onready var quick_action_container: HBoxContainer = $VirtualDPad/QuickActionContainer
@onready var quick_undo_btn: Button = $VirtualDPad/QuickActionContainer/QuickUndoBtn
@onready var quick_restart_btn: Button = $VirtualDPad/QuickActionContainer/QuickRestartBtn

var _float_tween: Tween
var _base_card_y: float = 96.0
var _is_bncc_open: bool = false

func _ready() -> void:
	var all_btns: Array[Button] = [
		grade_button, undo_button, restart_button, prev_button, next_button,
		owl_button, access_button, fullscreen_button, toggle_bncc_button, music_button, sfx_button,
		close_bncc_btn, dismiss_bncc_btn,
		up_btn, down_btn, left_btn, right_btn, quick_undo_btn, quick_restart_btn
	]
	for btn in all_btns:
		if btn:
			btn.focus_mode = Control.FOCUS_NONE

	if grade_button:
		grade_button.pressed.connect(func():
			SoundManager.play("click")
			change_grade_pressed.emit()
		)

	if undo_button:
		undo_button.pressed.connect(func():
			SoundManager.play("click")
			undo_pressed.emit()
		)
	if restart_button:
		restart_button.pressed.connect(func():
			SoundManager.play("click")
			restart_pressed.emit()
		)
	if prev_button:
		prev_button.pressed.connect(func():
			SoundManager.play("click")
			prev_level_pressed.emit()
		)
	if next_button:
		next_button.pressed.connect(func():
			SoundManager.play("click")
			next_level_pressed.emit()
		)

	if owl_button:
		owl_button.pressed.connect(func():
			SoundManager.play("click")
			pedagogical_pressed.emit()
		)

	if access_button:
		access_button.pressed.connect(func():
			SoundManager.play("click")
			accessibility_pressed.emit()
		)

	if fullscreen_button:
		fullscreen_button.pressed.connect(func():
			SoundManager.play("click")
			toggle_fullscreen()
		)

	if toggle_bncc_button:
		toggle_bncc_button.pressed.connect(func():
			SoundManager.play("click")
			toggle_bncc_modal()
		)

	if music_button:
		music_button.pressed.connect(func():
			SoundManager.play("click")
			if SoundManager.instance:
				SoundManager.instance.toggle_music()
		)

	if sfx_button:
		sfx_button.pressed.connect(func():
			SoundManager.play("click")
			if SoundManager.instance:
				SoundManager.instance.toggle_sfx()
		)

	# Virtual DPad connections
	if up_btn:
		up_btn.pressed.connect(func(): dpad_direction_pressed.emit(Vector2i.UP))
	if down_btn:
		down_btn.pressed.connect(func(): dpad_direction_pressed.emit(Vector2i.DOWN))
	if left_btn:
		left_btn.pressed.connect(func(): dpad_direction_pressed.emit(Vector2i.LEFT))
	if right_btn:
		right_btn.pressed.connect(func(): dpad_direction_pressed.emit(Vector2i.RIGHT))
	if quick_undo_btn:
		quick_undo_btn.pressed.connect(func():
			SoundManager.play("click")
			undo_pressed.emit()
		)
	if quick_restart_btn:
		quick_restart_btn.pressed.connect(func():
			SoundManager.play("click")
			restart_pressed.emit()
		)

	if SoundManager.instance:
		SoundManager.instance.music_toggled.connect(func(_enabled: bool): _update_audio_buttons())
		SoundManager.instance.sfx_toggled.connect(func(_enabled: bool): _update_audio_buttons())
	_update_audio_buttons()

	if close_bncc_btn:
		close_bncc_btn.pressed.connect(func():
			SoundManager.play("click")
			close_bncc_modal()
		)
	if dismiss_bncc_btn:
		dismiss_bncc_btn.pressed.connect(func():
			SoundManager.play("click")
			close_bncc_modal()
		)

	if bncc_modal:
		bncc_modal.visible = false
	if bncc_card:
		_base_card_y = bncc_card.position.y

	get_tree().root.size_changed.connect(_on_viewport_size_changed)
	_on_viewport_size_changed()

func toggle_fullscreen() -> void:
	if OS.has_feature("web"):
		JavaScriptBridge.eval("""
			(function() {
				var doc = document;
				if (!doc.fullscreenElement && !doc.webkitFullscreenElement && !doc.mozFullScreenElement && !doc.msFullscreenElement) {
					var el = doc.documentElement;
					if (el.requestFullscreen) {
						el.requestFullscreen().catch(function(e) {});
					} else if (el.webkitRequestFullscreen) {
						el.webkitRequestFullscreen();
					} else if (el.mozRequestFullScreen) {
						el.mozRequestFullScreen();
					} else if (el.msRequestFullscreen) {
						el.msRequestFullscreen();
					}
				} else {
					if (doc.exitFullscreen) {
						doc.exitFullscreen();
					} else if (doc.webkitExitFullscreen) {
						doc.webkitExitFullscreen();
					} else if (doc.mozCancelFullScreen) {
						doc.mozCancelFullScreen();
					} else if (doc.msExitFullscreen) {
						doc.msExitFullscreen();
					}
				}
			})();
		""")
	else:
		var mode := DisplayServer.window_get_mode()
		if mode == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_viewport_size_changed() -> void:
	var vp := get_viewport()
	if not vp:
		return
	var vp_size: Vector2 = vp.get_visible_rect().size
	var screen_w: float = vp_size.x
	var screen_h: float = vp_size.y
	var is_portrait: bool = screen_h > screen_w

	if objective_panel:
		var panel_w: float = minf(620.0, maxf(screen_w - 24.0, 260.0))
		objective_panel.offset_left = -panel_w / 2.0
		objective_panel.offset_right = panel_w / 2.0

	# Posição aproximada se não informada pelo LevelManager
	var approx_board_bottom := (screen_w * 0.85) + 162.0 if is_portrait else screen_h * 0.75
	adjust_controls_layout(is_portrait, approx_board_bottom, screen_w, screen_h)

func adjust_controls_layout(is_portrait: bool, board_bottom: float, screen_w: float, screen_h: float) -> void:
	if not virtual_dpad:
		return

	if is_portrait:
		# Modo Vertical: amplia consideravelmente os controles e centraliza na área vazia abaixo do tabuleiro
		var free_h: float = maxf(screen_h - board_bottom, 220.0)
		# Escala ampliada (1.35x a 1.65x) proporcional ao espaço livre
		var dpad_scale: float = clampf(free_h / 230.0, 1.35, 1.65)
		virtual_dpad.scale = Vector2(dpad_scale, dpad_scale)

		var effective_dpad_h: float = 190.0 * dpad_scale
		# Centraliza verticalmente no espaço livre
		var target_y: float = board_bottom + (free_h - effective_dpad_h) / 2.0
		target_y = clampf(target_y, board_bottom + 6.0, screen_h - effective_dpad_h - 10.0)

		virtual_dpad.set_anchors_preset(Control.PRESET_TOP_LEFT)
		virtual_dpad.position = Vector2(20.0, target_y)

		if quick_action_container:
			# Posiciona botões de ação na direita do display, ergonomicamente para o polegar direito
			var quick_w: float = 142.0 * dpad_scale
			var right_offset_x: float = (screen_w - 24.0 - quick_w - virtual_dpad.position.x) / dpad_scale
			quick_action_container.position.x = maxf(right_offset_x, 150.0)
			quick_action_container.position.y = 80.0
	else:
		# Modo Horizontal: escala padrão compacta no canto inferior esquerdo
		virtual_dpad.scale = Vector2.ONE
		virtual_dpad.set_anchors_preset(Control.PRESET_BOTTOM_LEFT)
		virtual_dpad.offset_left = 24.0
		virtual_dpad.offset_right = 214.0
		virtual_dpad.offset_bottom = -10.0
		virtual_dpad.offset_top = -200.0
		if quick_action_container:
			quick_action_container.position = Vector2(230.0, 140.0)

func set_virtual_dpad_visible(is_vis: bool) -> void:
	if virtual_dpad:
		virtual_dpad.visible = is_vis

func set_large_text_mode(is_large: bool) -> void:
	var scale_factor := 1.2 if is_large else 1.0
	if title_label and title_label.label_settings:
		title_label.label_settings.font_size = int(17 * scale_factor)
	if steps_label and steps_label.label_settings:
		steps_label.label_settings.font_size = int(15 * scale_factor)
	if objective_label and objective_label.label_settings:
		objective_label.label_settings.font_size = int(15 * scale_factor)
	if math_status_label and math_status_label.label_settings:
		math_status_label.label_settings.font_size = int(14 * scale_factor)

func _update_audio_buttons() -> void:
	if not SoundManager.instance:
		return
	var music_on := SoundManager.instance.is_music_enabled()
	var sfx_on := SoundManager.instance.is_sfx_enabled()

	if music_button:
		music_button.modulate = Color(1.0, 1.0, 1.0, 1.0) if music_on else Color(1.0, 1.0, 1.0, 0.35)
		music_button.tooltip_text = "Música: " + ("Ligada" if music_on else "Desligada")

	if sfx_button:
		sfx_button.modulate = Color(1.0, 1.0, 1.0, 1.0) if sfx_on else Color(1.0, 1.0, 1.0, 0.35)
		sfx_button.tooltip_text = "Efeitos Sonoros: " + ("Ligados" if sfx_on else "Desligados")

func update_level_info(level_dict: Dictionary) -> void:
	var g: int = level_dict.get("grade", 1)
	var is_classic: bool = level_dict.get("is_classic", false) or (g == 0)
	var is_extra: bool = (g == 6)
	if grade_button:
		if is_classic:
			grade_button.text = "🏆 Clássico"
		elif is_extra:
			grade_button.text = "💡 Lógica Extra"
		else:
			grade_button.text = "%dº Ano" % g
	if title_label:
		if is_classic:
			title_label.text = "Sokoban Clássico | " + level_dict.get("title", "Fase")
		elif is_extra:
			title_label.text = "Lógica Computacional | " + level_dict.get("title", "Fase")
		else:
			title_label.text = "SokoMath | " + level_dict.get("title", "Fase")
	if objective_label:
		if is_classic:
			objective_label.text = "Desafio: " + level_dict.get("rule_description", "Empurre todas as caixas aos alvos!")
		else:
			objective_label.text = "Desafio: " + level_dict.get("rule_description", "")
	if bncc_code_label:
		bncc_code_label.text = level_dict.get("bncc_code", "Sokoban Clássico" if is_classic else "Pensamento Computacional")
	if bncc_desc_label:
		bncc_desc_label.text = level_dict.get("bncc_desc", "")
	if toggle_bncc_button:
		toggle_bncc_button.visible = not is_classic
	if owl_button:
		owl_button.visible = true

func update_steps(steps: int, optimal: int) -> void:
	if steps_label:
		steps_label.text = "Passos: %d (Meta: %d)" % [steps, optimal]

func update_math_status(status_text: String, is_satisfied: bool) -> void:
	if math_status_label:
		math_status_label.text = status_text
		if is_satisfied:
			math_status_label.modulate = Color(0.35, 1.0, 0.45)
		else:
			math_status_label.modulate = Color(1.0, 0.88, 0.35)

func toggle_bncc_modal() -> void:
	if _is_bncc_open:
		close_bncc_modal()
	else:
		open_bncc_modal()

func open_bncc_modal() -> void:
	if not bncc_modal or not bncc_card:
		return
	_is_bncc_open = true
	bncc_modal.visible = true
	if toggle_bncc_button:
		toggle_bncc_button.text = "Fechar"

	bncc_card.scale = Vector2(0.85, 0.85)
	bncc_card.modulate.a = 0.0

	var open_tween := create_tween().set_parallel(true).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	open_tween.tween_property(bncc_card, "scale", Vector2.ONE, 0.25)
	open_tween.tween_property(bncc_card, "modulate:a", 1.0, 0.2)
	open_tween.chain().tween_callback(Callable(self, "_start_floating_animation"))

func close_bncc_modal() -> void:
	if not bncc_modal or not bncc_card:
		return
	_is_bncc_open = false
	_stop_floating_animation()
	if toggle_bncc_button:
		toggle_bncc_button.text = "Dica"

	var close_tween := create_tween().set_parallel(true).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	close_tween.tween_property(bncc_card, "scale", Vector2(0.85, 0.85), 0.18)
	close_tween.tween_property(bncc_card, "modulate:a", 0.0, 0.15)
	close_tween.chain().tween_callback(func():
		if not _is_bncc_open:
			bncc_modal.visible = false
	)

func _start_floating_animation() -> void:
	_stop_floating_animation()
	if not bncc_card or not _is_bncc_open:
		return

	_float_tween = create_tween().set_loops().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	_float_tween.tween_property(bncc_card, "position:y", _base_card_y - 7.0, 1.8)
	_float_tween.tween_property(bncc_card, "position:y", _base_card_y + 7.0, 1.8)

func _stop_floating_animation() -> void:
	if _float_tween and _float_tween.is_valid():
		_float_tween.kill()
	_float_tween = null
