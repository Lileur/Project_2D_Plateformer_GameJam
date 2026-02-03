extends AnimatableBody2D

@export var move_offset := Vector2(112,0)
@export var speed := 1.5

var start_position: Vector2
var t := 0.0

func _ready():
	start_position = global_position

func _process(delta):
	t += delta * speed
	global_position = start_position + move_offset * sin(t)
