extends RigidBody2D

@export var speed := 15;
@export var jump_wait_time := 1;
@export var jump_length := 2;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var jumping := false;
var perform_jump := false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not (jumping or perform_jump):
		$AnimatedSprite2D.play("walk");
		var collision := move_and_collide(Vector2.RIGHT * speed * delta);
		
		if collision and collision.get_angle() != 0:
			jump();
	if perform_jump:
		apply_central_force(Vector2.UP * 1000);
		apply_central_force(Vector2.RIGHT * speed);


func jump():
	jumping = true;
	$AnimatedSprite2D.play("sit");
	await get_tree().create_timer(jump_wait_time).timeout;
	$AnimatedSprite2D.play("jump");
	
	jumping = false;
	perform_jump = true;
	get_tree().create_timer(jump_length).timeout.connect(func (): perform_jump = false);
