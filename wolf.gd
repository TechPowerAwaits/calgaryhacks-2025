class_name Wolf
extends RigidBody2D

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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lock_rotation = true;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if state == WALK:
		$AnimatedSprite2D.play("walk");
		var movVec = Vector2.RIGHT * speed * delta;
		var collision := move_and_collide(movVec, true);
		
		if collision and is_equal_approx(collision.get_angle(), PI/2):
			jump();
		else:
			move_and_collide(movVec);
	elif state == JUMP:
		apply_central_force(Vector2.UP * 1020);
		apply_central_force(Vector2.RIGHT * jump_speed);


func jump():
	state = SIT;
	$AnimatedSprite2D.play("sit");
	await get_tree().create_timer(jump_wait_time).timeout;
	
	$AnimatedSprite2D.play("jump", 0.6);
	state = JUMP;
	get_tree().create_timer(jump_length).timeout.connect(func (): state = WALK);

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
