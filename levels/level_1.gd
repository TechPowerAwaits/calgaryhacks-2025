extends Node2D


func _on_wolves_death_limit_reached() -> void:
	get_tree().change_scene_to_file("res://levels/game_over.tscn");


func _on_wolves_wolves_gone() -> void:
	get_tree().change_scene_to_file("res://levels/Level_2.tscn");
