class_name Wolf
extends RigidBody2D

# https://docs.godotengine.org/en/stable/classes/class_physicsserver2d.html#class-physicsserver2d-method-body-set-axis-velocity
# test_move would be better to use than move_and_collide as it is more clear as to what is going on.
# Needs more space to jump -- maybe 16px so it can jump at a 45 degree angle. Doesn't do what I expect.

@export var speed := 70.0;
@export var jump_wait_time := 0.5;
@export var jump_length := 2.0;
@export var jump_speed = 20.0;

@export var time_before_death := 1.0;
@export var corpse_till := 0.5;

signal dead
signal saved

enum {SIT, WALK, JUMP, DIE}
var state := WALK;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if state == WALK:
		$AnimatedSprite2D.play("walk");
		var movVec = Vector2.RIGHT * speed * delta;
		var collision := move_and_collide(movVec, true, 16.0);
		
		if collision and is_equal_approx(collision.get_angle(), PI/2):
			jump();
		else:
			move_and_collide(movVec);
	elif state == JUMP && not constant_force:
		add_constant_force(Vector2.UP * 1014);


var posBeforeJump: Vector2
func jump():
	state = SIT;
	$AnimatedSprite2D.play("sit");
	await get_tree().create_timer(jump_wait_time).timeout;
	
	$AnimatedSprite2D.play("jump", 0.6);
	state = JUMP;
	posBeforeJump = position;
	get_tree().create_timer(jump_length).timeout.connect(postJump);


func postJump():
	print(position - posBeforeJump);
	#state = WALK;


func hurt() -> void:
	if state != DIE:
		await get_tree().create_timer(time_before_death).timeout;
		$DeathWhine.play();
		$AnimatedSprite2D.play("death");
		state = DIE;


func save() -> void:
	emit_signal("saved");
	queue_free();


func _on_animated_sprite_2d_animation_finished() -> void:
	if state == DIE:
		emit_signal("dead");
		get_tree().create_timer(corpse_till).timeout.connect(queue_free);
