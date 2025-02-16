extends RigidBody2D

@export var speed := 15;
@export var jump_wait_time := 2;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var jumping := false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not jumping:
		$AnimatedSprite2D.play("walk");
		var collision := move_and_collide(Vector2.RIGHT * speed * delta);
		
		#if collision and collision.get_local_shape() == $JumpDetector.shape: #and collision.get_angle() == PI/2:
		#	jump();


func jump():
	jumping = true;
	$AnimatedSprite2D.play("sit");
	await get_tree().create_timer(jump_wait_time);
	###move_and_collide(Vector2(Vector2.LEFT * speed));
	$AnimatedSprite2D.play("jump");
	###move_and_collide(Vector2(speed, 32));
	#move_and_collide(Vector2.UP * 250);
	jumping = false;
