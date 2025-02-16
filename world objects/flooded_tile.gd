extends Area2D

var is_safe := false;

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Shovel":
		$Sprite2D.texture = load("");
		is_safe = true;


func _on_body_entered(body: Node2D) -> void:
	if body is Wolf and not is_safe:
		body.hurt();
