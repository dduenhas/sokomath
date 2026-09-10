class_name Surfaces
extends RefCounted

# Returns the surface name from the given collision object, or empty string if it can't be determined.
static func detect(collider: CollisionObject3D) -> String:
	var mesh: MeshInstance3D = null
	if collider.get_child_count() > 0:
		for i: int in collider.get_child_count():
			var child: Node3D = collider.get_child(i)
			if child is MeshInstance3D:
				mesh = child
				break
	if mesh == null:
		var n: Node = collider.get_parent()
		while n != null and not n is MeshInstance3D:
			n = n.get_parent()
		mesh = n
	if mesh == null:
		return ""
	return mesh.mesh.surface_get_material(0).resource_name
