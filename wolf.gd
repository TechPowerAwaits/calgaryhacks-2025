extends RigidBody2D

@export var speed = 15;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play("walk");
	move_and_collide(Vector2.RIGHT * speed * delta);
