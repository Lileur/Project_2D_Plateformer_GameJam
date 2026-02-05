extends Node2D


@onready var top_left: Marker2D = $CameraLimits/TopLeft
@onready var bottom_right: Marker2D = $CameraLimits/BottomRight

func _ready():
	call_deferred("_apply_camera_limits")


func _apply_camera_limits():
	var player = get_tree().current_scene.get_node("Player/CharacterBody2D")
	var camera = player.get_node("Camera2D")
	
	camera.make_current()
	
	
	camera.limit_left   = int(top_left.global_position.x)
	camera.limit_top    = int(top_left.global_position.y)
	camera.limit_right  = int(bottom_right.global_position.x)
	camera.limit_bottom = int(bottom_right.global_position.y)



 
