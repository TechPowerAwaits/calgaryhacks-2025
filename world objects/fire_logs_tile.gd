extends Area2D

@export var extinguished_texture: SpriteFrames;
@export var fire_texture: SpriteFrames;

var is_extinguished: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if $AnimatedSprite2D:
		$AnimatedSprite2D.sprite_frames = fire_texture;
	$AnimatedSprite2D.play("default");

func _on_area_entered(area: Area2D) -> void:
	if area.name == "WaterBucket":
		extinguish_fire();

func extinguish_fire() -> void: 
	if not is_extinguished:
		is_extinguished = true;
		if $AnimatedSprite2D:
			$AnimatedSprite2D.sprite_frames = extinguished_texture;

func _on_body_entered(body: Node2D) -> void:
	if body is Wolf and not is_extinguished:
		body.hurt();
