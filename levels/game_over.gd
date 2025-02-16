extends ColorRect


func _on_main_menu_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/main_menu.tscn");


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/Level_1.tscn");
