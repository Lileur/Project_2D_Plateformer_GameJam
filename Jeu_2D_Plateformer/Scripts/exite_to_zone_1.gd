extends Area2D

@export var target_scene_path: String
@export var spawn_position: Vector2

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		ZoneManager.change_zone("res://Scenes/1_st_zone.tscn", Vector2(32, -50))
