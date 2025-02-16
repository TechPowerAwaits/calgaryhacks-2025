extends Node

signal death_limit_reached
signal wolves_gone

@export var child_death_limit := 1;

var wolf_count := 0;

func _on_child_entered_tree(node: Node) -> void:
	if node is Wolf:
		node.dead.connect(_on_child_dead);
		node.saved.connect(_on_child_saved);
		wolf_count += 1;

func _on_child_dead():
	child_death_limit -= 1;
	wolf_count -= 1;
	if child_death_limit == 0:
		emit_signal("death_limit_reached");
	elif wolf_count == 0:
		emit_signal("wolves_gone");

func _on_child_saved():
	wolf_count -= 1;
	if wolf_count == 0:
		emit_signal("wolves_gone");
