extends Node


func get_all_children(in_node: Node, array := []) -> Array:
	array.push_back(in_node)
	for child in in_node.get_children():
		array = get_all_children(child, array)
	return array


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Test Coverage Criteria Initialized")
	var nodes: Node = get_tree().get_root()
	print(nodes)
	get_tree().node_added.connect(_on_child_update)
	get_tree().node_removed.connect(_on_child_update)
	_on_child_update(nodes)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


# Called whenever a node is updated
func _on_child_update(node: Node):
	print("element")
	for element in get_all_children(get_tree().get_root()):
		print(element)
	
	print("tree updated on node:")
	print(node)
	print("=====================")
	
	if node.is_in_group("Enemy"):
		print("Number of enemies updated")
