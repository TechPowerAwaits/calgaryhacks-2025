extends ColorRect

@onready var animation_player = $AnimationPlayer;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_cinematic();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass;

func play_cinematic():
	if animation_player.has_animation("intro"):
		animation_player.play("intro");
		await animation_player.animation_finished;
		transition_to_level_1();

func transition_to_level_1():
	get_tree().change_scene_to_file("res://levels/Level_1.tscn");
