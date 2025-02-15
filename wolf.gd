extends Area2D

@export var progress_per_frame: float = 0.5

func _ready() -> void:
	$AnimatedSprite2D.play('walk');
	

func _physics_process(_delta: float) -> void:
	get_parent().progress += progress_per_frame;
