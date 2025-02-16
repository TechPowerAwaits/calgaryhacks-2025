extends Area2D

var target_scene = "res://main_menu.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent() is CharacterBody2D:
			area.get_parent().queue_free();
			get_tree().change_scene_to_file(target_scene)
