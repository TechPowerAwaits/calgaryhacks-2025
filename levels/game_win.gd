extends ColorRect

func _on_leave_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/main_menu.tscn");
