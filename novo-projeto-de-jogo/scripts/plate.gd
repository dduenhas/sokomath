class_name SokoPlate
extends Node2D

signal state_changed(plate: SokoPlate, is_satisfied: bool)

enum ConditionType {
	TARGET_VALUE,     # Exige um valor numérico específico
	ANY_VALUE,        # Aceita qualquer caixa
	EVEN,             # Exige um número par (x % 2 == 0)
	ODD,              # Exige um número ímpar (x % 2 != 0)
	GREATER_THAN,     # Exige valor > required_value
	LESS_THAN,        # Exige valor < required_value
	LOGIC_TRUE        # Lógica booleana (valor == 1)
}

@export var plate_id: String = "plate"
@export var condition_type: ConditionType = ConditionType.ANY_VALUE
@export var required_value: int = 0
@export var label_text: String = ""

var grid_pos: Vector2i = Vector2i.ZERO
var current_box: SokoBox = null
var is_satisfied: bool = false

@onready var frame_sprite: Sprite2D = $FrameSprite
@onready var sprite: Sprite2D = $Sprite2D
@onready var indicator_sprite: Sprite2D = $Indicator
@onready var yellow_glow: Sprite2D = $YellowGlow
@onready var tag_badge: PanelContainer = $TagBadge
@onready var tag_label: Label = $TagBadge/Label

const TEX_FRAME_INACTIVE := "res://kenney_sokoban-pack/PNG/Default size/Environment/environment_06.png"
const TEX_FRAME_ACTIVE := "res://kenney_sokoban-pack/PNG/Default size/Environment/environment_07.png"
const TEX_BASE := "res://kenney_sokoban-pack/PNG/Default size/Environment/environment_02.png"
const TEX_ACTIVE := "res://kenney_sokoban-pack/PNG/Default size/Environment/environment_05.png"

func _ready() -> void:
	_start_yellow_glow_pulse()

func setup(p_grid_pos: Vector2i, p_type: ConditionType, p_val: int = 0, p_label: String = "", p_id: String = "") -> void:
	grid_pos = p_grid_pos
	condition_type = p_type
	required_value = p_val
	label_text = p_label
	if p_id != "":
		plate_id = p_id
	position = GridConstants.grid_to_world(grid_pos) + Vector2(32, 32)
	update_appearance()

func _start_yellow_glow_pulse() -> void:
	if not yellow_glow:
		return
	var tween := create_tween().set_loops()
	tween.tween_property(yellow_glow, "modulate:a", 0.9, 0.75).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.parallel().tween_property(yellow_glow, "scale", Vector2(0.75, 0.58), 0.75).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(yellow_glow, "modulate:a", 0.35, 0.75).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.parallel().tween_property(yellow_glow, "scale", Vector2(0.55, 0.42), 0.75).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func update_appearance() -> void:
	if not is_inside_tree():
		await ready

	if tag_label:
		if label_text != "":
			tag_label.text = label_text
		else:
			match condition_type:
				ConditionType.TARGET_VALUE:
					tag_label.text = str(required_value)
				ConditionType.EVEN:
					tag_label.text = "PAR"
				ConditionType.ODD:
					tag_label.text = "ÍMPAR"
				ConditionType.GREATER_THAN:
					tag_label.text = ">" + str(required_value)
				ConditionType.LESS_THAN:
					tag_label.text = "<" + str(required_value)
				ConditionType.LOGIC_TRUE:
					tag_label.text = "1"
				_:
					tag_label.text = "*"

	_update_visual_state(false)

func evaluate_box(box: SokoBox) -> bool:
	current_box = box
	var satisfied := false

	if box != null:
		match condition_type:
			ConditionType.TARGET_VALUE:
				satisfied = (box.value == required_value)
			ConditionType.ANY_VALUE:
				satisfied = true
			ConditionType.EVEN:
				satisfied = (box.value % 2 == 0)
			ConditionType.ODD:
				satisfied = (box.value % 2 != 0)
			ConditionType.GREATER_THAN:
				satisfied = (box.value > required_value)
			ConditionType.LESS_THAN:
				satisfied = (box.value < required_value)
			ConditionType.LOGIC_TRUE:
				satisfied = (box.value == 1 or box.value > 0)

	if is_satisfied != satisfied:
		is_satisfied = satisfied
		_update_visual_state(is_satisfied)
		state_changed.emit(self, is_satisfied)
		if box:
			box.set_highlight(is_satisfied)
			if is_satisfied:
				SoundManager.play("plate", 0.05)

	return is_satisfied

func _update_visual_state(active: bool) -> void:
	if frame_sprite:
		frame_sprite.texture = load(TEX_FRAME_ACTIVE if active else TEX_FRAME_INACTIVE)
		if active:
			var tween = create_tween()
			tween.tween_property(frame_sprite, "scale", Vector2(1.15, 1.15), 0.1)
			tween.tween_property(frame_sprite, "scale", Vector2(1.0, 1.0), 0.1)

	if indicator_sprite:
		indicator_sprite.visible = active
		if active:
			indicator_sprite.texture = load(TEX_ACTIVE)
			var tween = create_tween()
			tween.tween_property(indicator_sprite, "scale", Vector2(1.2, 1.2), 0.1)
			tween.tween_property(indicator_sprite, "scale", Vector2(1.0, 1.0), 0.1)
