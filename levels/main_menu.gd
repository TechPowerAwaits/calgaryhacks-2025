extends TextureRect

func _ready() -> void:
	if OS.has_feature("web"):
		$quit.set_deferred("disabled", true);
		$quit.call_deferred("hide");

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/Cinematic1.tscn");

func _on_quit_pressed() -> void:
	get_tree().quit();
