class_name GridConstants
extends RefCounted

const TILE_SIZE: int = 64

static func grid_to_world(grid_pos: Vector2i, offset: Vector2 = Vector2.ZERO) -> Vector2:
	return Vector2(grid_pos.x * TILE_SIZE, grid_pos.y * TILE_SIZE) + offset

static func world_to_grid(world_pos: Vector2, offset: Vector2 = Vector2.ZERO) -> Vector2i:
	var local: Vector2 = world_pos - offset
	return Vector2i(int(floor(local.x / TILE_SIZE)), int(floor(local.y / TILE_SIZE)))
