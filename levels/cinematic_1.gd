extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("intro");
	await $AnimationPlayer.animation_finished;
	get_tree().change_scene_to_file("res://levels/Level_1.tscn");
