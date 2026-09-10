@tool
class_name SurfacesPlugin
extends EditorPlugin

const RUNTIME_SCRIPT = preload("surfaces.gd")

var import_plugin := preload("trimesh_split.gd").new()

func _enter_tree() -> void:
	add_scene_post_import_plugin(import_plugin)

func _exit_tree() -> void:
	remove_scene_post_import_plugin(import_plugin)
