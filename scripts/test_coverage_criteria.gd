extends Node

@onready var initial_enemies: int = 0
@onready var initial_collectables: inst = 0

@onready var enemies_coverage: int = 0
@onready var collectable_coverage: int = 0
@onready var entity_coverage: int = 0
@onready var hazard_coverage: int = 0
@onready var level_coverage: int = 0
@onready var npc_coverage: int = 0
@onready var path_coverage: int = 0
@onready var ui_coverage: int = 0
@onready var root_node: Node = get_tree().get_root()


func _ready() -> void:
	get_tree().node_added.connect(_on_child_update)
	get_tree().node_removed.connect(_on_child_update)
	_on_child_update(root_node)


func _on_child_update(node: Node) -> void:
	for element in get_all_children(root_node):
		pass
	
	# TODO: Calculate values
	if node.is_in_group("Enemy"):
		if initial_enemies == 0:
			initial_enemies = get_tree().get_nodes_in_group("Enemy").size()
	elif node.is_in_group("Collectable"):
		if initial_collectables == 0:
			initial_collectables = get_tree().get_nodes_in_group("Collectable").size()


func get_all_children(in_node: Node, array: Array= []) -> Array:
	array.push_back(in_node)
	for child in in_node.get_children():
		array = get_all_children(child, array)
	return array


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
	var collision_objects: Array = find_collisions(root_node)
	return collision_objects


# TODO: Calculate the hazards that the player collided with
func hazards_collided_with(_player: Node) -> Array:
	var hazards = get_tree().get_nodes_in_group("Hazard")
	return hazards
