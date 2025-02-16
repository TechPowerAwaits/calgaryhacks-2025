extends CanvasLayer

var is_paused: bool = false; 
var target_scene = "res://main_menu.tscn";

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pause_menu(false);
	process_mode = PROCESS_MODE_ALWAYS;
	
	$Panel/Resume.pressed.connect(_resume_game);
	$Panel/MainMenu.pressed.connect(_go_to_main_menu);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass;

func _on_pause_pressed() -> void:
	toggle_pause();

func toggle_pause():
	is_paused = !is_paused;
	pause_menu(is_paused);
	get_tree().paused = is_paused;

func pause_menu(_show: bool) -> void:
	$Panel.visible = _show;

	if _show:
		# Set menu size and position
		var viewport_size = get_viewport().get_visible_rect().size
		$Panel.size = Vector2(280, 160);
		$Panel.position = (viewport_size / 2) - ($Panel.size / 2);
		$Panel.modulate = Color(0.85, 0.85, 0.85, 0.85);
		$Panel.modulate.a = 0.8;

		# Set "Game Paused" text
		$Panel/Label.text = "Game Paused";
		$Panel/Label.scale = Vector2(1.5, 1.5);
		$Panel/Label.position = Vector2(60, 20); 

		# Set "Resume" Button
		$Panel/Resume.text = "Resume";
		$Panel/Resume.size = Vector2(150, 40);
		$Panel/Resume.position = Vector2(70, 70);  

		# Set "MainMenu" Button
		$Panel/MainMenu.text = "Main Menu";
		$Panel/MainMenu.size = Vector2(150, 40);
		$Panel/MainMenu.position = Vector2(70, 115);
	else:
		get_tree().paused = false 

func _resume_game():
	toggle_pause()  

func _go_to_main_menu():
	get_tree().paused = false  
	if target_scene:
		get_tree().change_scene_to_file(target_scene);
