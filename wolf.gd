extends Area2D

func _ready() -> void:
	$AnimatedSprite2D.play('walk');
	

func _physics_process(delta: float) -> void:
	pass
