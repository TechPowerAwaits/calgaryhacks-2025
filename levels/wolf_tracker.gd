extends Node

signal death_limit_reached

@export var child_death_limit := 1;

func _on_child_entered_tree(node: Node) -> void:
	if node is Wolf:
		node.dead.connect(_on_child_dead);

func _on_child_dead():
	child_death_limit -= 1;
	if child_death_limit == 0:
		emit_signal("death_limit_reached");
