extends Area2D

@export var extinguished_texture: SpriteFrames;
@export var fire_texture: SpriteFrames;

var is_extinguished: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if $AnimatedSprite2D:
		$AnimatedSprite2D.sprite_frames = fire_texture;
	$AnimatedSprite2D.play("default");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass;

func _on_area_entered(area: Area2D) -> void:
	if area.name == "WaterBucket":  
		extinguish_fire();

	if is_extinguished == false:
		if area.get_parent() is CharacterBody2D:
			area.get_parent().queue_free(); 

func extinguish_fire() -> void: 
	if not is_extinguished:
		is_extinguished = true;
		if $AnimatedSprite2D:
			$AnimatedSprite2D.sprite_frames = extinguished_texture;
