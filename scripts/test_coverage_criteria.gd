extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Test Coverage Criteria Initialized")
	var nodes: Node = get_node('/root')
	nodes.child_entered_tree.connect(_on_child_update)
	nodes.child_exiting_tree.connect(_on_child_update)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


# Called whenever a node is updated
func _on_child_update(node: Node):
	print("tree updated on node:")
	print(node)
	print("=====================")
	
	if node.is_in_group("Enemy"):
		print("Number of enemies updated")
