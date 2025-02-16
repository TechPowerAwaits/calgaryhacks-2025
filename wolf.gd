extends RigidBody2D

@export var speed := 70;
@export var jump_wait_time := 1;
@export var jump_length := 2;
@export var jump_speed = 20;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lock_rotation = true;

var jumping := false;
var perform_jump := false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not (jumping or perform_jump):
		$AnimatedSprite2D.speed_scale = 1.0;
		$AnimatedSprite2D.play("walk");
		var collision := move_and_collide(Vector2.RIGHT * speed * delta);
		
		if collision and is_equal_approx(collision.get_angle(), PI/2):
			position.x -= 8;
			# move_and_collide(Vector2.LEFT * speed * 5 * delta);
			jump();
	if perform_jump:
		apply_central_force(Vector2.UP * 1020);
		apply_central_force(Vector2.RIGHT * jump_speed);


func jump():
	jumping = true;
	$AnimatedSprite2D.play("sit");
	await get_tree().create_timer(jump_wait_time).timeout;
	$AnimatedSprite2D.play("jump");
	$AnimatedSprite2D.speed_scale = 0.6;
	
	jumping = false;
	perform_jump = true;
	get_tree().create_timer(jump_length).timeout.connect(func (): perform_jump = false);
