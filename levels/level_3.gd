extends Node2D


func _on_wolves_death_limit_reached() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://levels/game_over.tscn");


func _on_wolves_wolves_gone() -> void:
	$LevelTransition.play("Fade Out");
	await $LevelTransition.animation_finished;
	get_tree().call_deferred("change_scene_to_file", "res://levels/game_win.tscn");
