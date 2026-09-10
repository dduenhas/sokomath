class_name SokoBox
extends Node2D

@export var value: int = 1
@export var color_theme: String = "wood"

var grid_pos: Vector2i = Vector2i.ZERO
var is_moving: bool = false

@onready var sprite: Sprite2D = $Sprite2D
@onready var value_label: Label = $ValueBadge/Label
@onready var badge: PanelContainer = $ValueBadge

const TEXTURES := {
	"wood": "res://kenney_sokoban-pack/PNG/Default size/Crates/crate_01.png",
	"beige": "res://kenney_sokoban-pack/PNG/Default size/Crates/crate_02.png",
	"red": "res://kenney_sokoban-pack/PNG/Default size/Crates/crate_03.png",
	"blue": "res://kenney_sokoban-pack/PNG/Default size/Crates/crate_04.png",
	"green": "res://kenney_sokoban-pack/PNG/Default size/Crates/crate_05.png",
	"yellow": "res://kenney_sokoban-pack/PNG/Default size/Crates/crate_06.png",
	"metal": "res://kenney_sokoban-pack/PNG/Default size/Crates/crate_42.png"
}

func setup(p_grid_pos: Vector2i, p_val: int, p_theme: String = "wood") -> void:
	grid_pos = p_grid_pos
	value = p_val
	color_theme = p_theme
	position = GridConstants.grid_to_world(grid_pos) + Vector2(32, 32)
	update_appearance()

func update_appearance() -> void:
	if not is_inside_tree():
		await ready

	var tex_path: String = TEXTURES.get(color_theme, TEXTURES["wood"])
	var tex = load(tex_path)
	if tex and sprite:
		sprite.texture = tex

	if value_label:
		value_label.text = str(value)

func move_to(target_grid: Vector2i, duration: float = 0.15) -> Signal:
	grid_pos = target_grid
	is_moving = true
	var target_world: Vector2 = GridConstants.grid_to_world(grid_pos) + Vector2(32, 32)
	var tween: Tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position", target_world, duration)
	tween.finished.connect(func(): is_moving = false)
	return tween.finished

func set_highlight(active: bool) -> void:
	var tween: Tween = create_tween()
	if active:
		tween.tween_property(self, "scale", Vector2(1.1, 1.1), 0.1)
		modulate = Color(1.1, 1.2, 1.1)
	else:
		tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.1)
		modulate = Color.WHITE
