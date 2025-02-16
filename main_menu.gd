extends Node2D

var target_scene = "res://Level_1.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	if target_scene:
		get_tree().change_scene_to_file(target_scene);

func _on_quit_pressed() -> void:
	get_tree().quit();
