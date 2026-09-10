class_name SokoPlayer
extends Node2D

var grid_pos: Vector2i = Vector2i.ZERO
var is_moving: bool = false
var current_facing: Vector2i = Vector2i.DOWN

@onready var sprite: Sprite2D = $Sprite2D

const SPRITES_IDLE := {
	Vector2i.DOWN: "res://kenney_sokoban-pack/PNG/Default size/Player/player_05.png",
	Vector2i.UP: "res://kenney_sokoban-pack/PNG/Default size/Player/player_08.png",
	Vector2i.RIGHT: "res://kenney_sokoban-pack/PNG/Default size/Player/player_17.png",
	Vector2i.LEFT: "res://kenney_sokoban-pack/PNG/Default size/Player/player_20.png"
}

const SPRITES_PUSH := {
	Vector2i.DOWN: "res://kenney_sokoban-pack/PNG/Default size/Player/player_07.png",
	Vector2i.UP: "res://kenney_sokoban-pack/PNG/Default size/Player/player_10.png",
	Vector2i.RIGHT: "res://kenney_sokoban-pack/PNG/Default size/Player/player_18.png",
	Vector2i.LEFT: "res://kenney_sokoban-pack/PNG/Default size/Player/player_21.png"
}

func setup(p_grid_pos: Vector2i) -> void:
	grid_pos = p_grid_pos
	position = GridConstants.grid_to_world(grid_pos) + Vector2(32, 32)
	set_facing(Vector2i.DOWN)

func set_facing(dir: Vector2i, is_pushing: bool = false) -> void:
	current_facing = dir
	if not sprite:
		return
	var dict := SPRITES_PUSH if is_pushing else SPRITES_IDLE
	var path: String = dict.get(dir, SPRITES_IDLE[Vector2i.DOWN])
	var tex = load(path)
	if tex:
		sprite.texture = tex

func move_to(target_grid: Vector2i, is_pushing: bool = false, duration: float = 0.15) -> Signal:
	var dir := target_grid - grid_pos
	grid_pos = target_grid
	is_moving = true
	set_facing(dir, is_pushing)

	var target_world: Vector2 = GridConstants.grid_to_world(grid_pos) + Vector2(32, 32)
	var tween: Tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position", target_world, duration)
	tween.finished.connect(func():
		is_moving = false
		set_facing(current_facing, false)
	)
	return tween.finished

func jump_to(target_grid: Vector2i) -> void:
	grid_pos = target_grid
	position = GridConstants.grid_to_world(grid_pos) + Vector2(32, 32)
	is_moving = false
	set_facing(current_facing, false)
