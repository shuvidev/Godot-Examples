extends Node


func get_all_children(in_node: Node, array := []) -> Array:
	array.push_back(in_node)
	for child in in_node.get_children():
		array = get_all_children(child, array)
	return array


func _ready() -> void:
	var nodes: Node = get_tree().get_root()
	get_tree().node_added.connect(_on_child_update)
	get_tree().node_removed.connect(_on_child_update)
	_on_child_update(nodes)


func _process(_delta: float) -> void:
	pass


func _on_child_update(node: Node) -> void:
	for element in get_all_children(get_tree().get_root()):
		pass
	
	# TODO: Calculate values
	if node.is_in_group("Enemy"):
		pass
	elif node.is_in_group("Collectable"):
		pass


func find_collisions(node: Node, collision_objects: Array = []) -> Array:
		if node.has_node("CollisionShape2D") or node.has_node("CollisionShape3D"):
			collision_objects.append(node)
		elif node is TileMap:
			collision_objects.append(node)
		for child in node.get_children():
			if child is Node:
				find_collisions(child, collision_objects)
		return collision_objects

func get_all_collisions() -> Array:
	var collision_objects: Array = find_collisions(get_tree().get_root())
	return collision_objects


# TODO: Calculate the hazards that the player collided with
func hazards_collided_with(player: Node) -> Array:
	var hazards = get_tree().get_nodes_in_group("Hazard")
	return hazards
