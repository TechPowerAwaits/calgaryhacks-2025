extends Node2D


func _ready() -> void:
	$DeathLabel.hide();


func _on_wolf_tracker_death_limit_reached() -> void:
	$DeathLabel.show();
