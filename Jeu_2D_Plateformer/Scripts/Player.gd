extends CharacterBody2D

@onready var timer = $Timer

func _ready():
	add_to_group("player")
	
	
const SPEED = 200.0
const JUMP_VELOCITY = -350.0

var can_double_jump := false
var jump_count := 0
var max_jumps := 1

func unlock_double_jump():
	can_double_jump = true
	max_jumps = 2



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_on_floor():
		jump_count = 0
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.		
	if Input.is_action_just_pressed("jump") and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count += 1
		
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func die():
	timer.start
	Engine.time_scale = 0.5
	global_position = Vector2(0, -32)  # point de respawn
	Engine.time_scale = 1
	
