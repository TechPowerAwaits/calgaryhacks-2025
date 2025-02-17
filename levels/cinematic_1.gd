extends ColorRect

enum {INTRO, FADE_OUT}

var state := INTRO;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("intro");


func _process(_delta: float) -> void:
	if Input.is_action_pressed("skip_cutscene"):
		_fade_out();


func _fade_out():
	if state != FADE_OUT:
		state = FADE_OUT;
		$SkipText.hide();
		$AnimationPlayer.play("Outro");


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	if state == INTRO:
		_fade_out();
	elif state == FADE_OUT:
		get_tree().change_scene_to_file("res://levels/Level_1.tscn");
