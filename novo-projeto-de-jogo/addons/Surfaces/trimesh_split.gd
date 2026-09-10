# Splits meshes with static triangle mesh collision shapes by material
@tool
extends EditorScenePostImportPlugin

func _pre_process(scene: Node):
	_process_node(scene)

func _process_node(node: Node) -> void:
	for child in node.get_children():
		_process_node(child)

	if node is not CollisionShape3D:
		return
	var shape: CollisionShape3D = node as CollisionShape3D
	if shape.shape is not ConcavePolygonShape3D:
		return

	var parent := shape.get_parent()
	if parent is not StaticBody3D:
		return
	
	var body: StaticBody3D = parent as StaticBody3D
	if body.name != "StaticBody3D":
		# if the name is something else (set by the user), it must be a -colonly node. Leave it alone.
		return
	
	var grandparent := body.get_parent()
	if grandparent is not ImporterMeshInstance3D:
		return
	var mesh_instance: ImporterMeshInstance3D = grandparent
	var mesh := mesh_instance.mesh

	var surface_count := mesh.get_surface_count()
	if surface_count <= 1:
		return

	mesh_instance.mesh = _build_single_surface_mesh(mesh, 0)
	shape.shape = _build_concave_shape_from_surface(mesh, 0)

	for i in range(1, surface_count):
		var child_mesh_instance := ImporterMeshInstance3D.new()
		child_mesh_instance.name = "%s_surface_%d" % [mesh_instance.name, i]
		child_mesh_instance.mesh = _build_single_surface_mesh(mesh, i)
		child_mesh_instance.cast_shadow = mesh_instance.cast_shadow
		child_mesh_instance.layer_mask = mesh_instance.layer_mask
		child_mesh_instance.visibility_range_begin = mesh_instance.visibility_range_begin
		child_mesh_instance.visibility_range_begin_margin = mesh_instance.visibility_range_begin_margin
		child_mesh_instance.visibility_range_end = mesh_instance.visibility_range_end
		child_mesh_instance.visibility_range_end_margin = mesh_instance.visibility_range_end_margin
		child_mesh_instance.visibility_range_fade_mode = mesh_instance.visibility_range_fade_mode

		mesh_instance.add_child(child_mesh_instance)
		child_mesh_instance.owner = mesh_instance.owner

		var child_body := StaticBody3D.new()
		child_body.name = "StaticBody3D"
		child_mesh_instance.add_child(child_body)
		child_body.owner = child_mesh_instance.owner

		var child_shape := CollisionShape3D.new()
		child_shape.name = "CollisionShape3D"
		child_shape.shape = _build_concave_shape_from_surface(mesh, i)
		child_body.add_child(child_shape)
		child_shape.owner = child_body.owner

func _build_single_surface_mesh(src: ImporterMesh, surface: int) -> ImporterMesh:
	var m := ImporterMesh.new()
	var blend_shapes: Array[Array] = []
	for i: int in src.get_blend_shape_count():
		blend_shapes.append(src.get_surface_blend_shape_arrays(surface, i))
	var lods: Dictionary = {}
	for lod: int in src.get_surface_lod_count(surface):
		lods[src.get_surface_lod_size(surface, lod)] = src.get_surface_lod_indices(surface, lod)
	m.add_surface(src.get_surface_primitive_type(surface), src.get_surface_arrays(surface), blend_shapes, lods, src.get_surface_material(surface), src.get_surface_name(surface), src.get_surface_format(surface))
	return m

func _build_concave_shape_from_surface(mesh: ImporterMesh, surface: int) -> ConcavePolygonShape3D:
	var arrays := mesh.get_surface_arrays(surface)
	var verts : PackedVector3Array = arrays[Mesh.ARRAY_VERTEX]
	var indices : PackedInt32Array = arrays[Mesh.ARRAY_INDEX]

	var faces := PackedVector3Array()

	if indices.is_empty():
		for v in verts:
			faces.append(v)
	else:
		for idx in indices:
			faces.append(verts[idx])

	if faces.is_empty():
		return null

	var shape := ConcavePolygonShape3D.new()
	shape.data = faces
	return shape
