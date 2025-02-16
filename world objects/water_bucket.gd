extends Area2D

@export var return_speed: float = 5.0;

var dragging: bool = false;
var start_position: Vector2 = Vector2(128, 512);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position();
	else:
		global_position = global_position.lerp(start_position, return_speed * delta);

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			dragging = true;  
		elif not event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			dragging = false;  
