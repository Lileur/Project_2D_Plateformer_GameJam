extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -350.0

var can_double_jump := false
var jump_count := 0
var max_jumps := 1

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


func _on_exite_to_zone_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var main = get_tree().current_scene
		var container = main.get_node("ZoneContainer")
		
		# Supprimer la zone actuelle
		for child in container.get_children():
			child.queue_free()
			
		# Charger la nouvelle zone
		var new_zone = preload("res://Scenes/2_nd_zone.tscn").instantiate() 
		container.add_child(new_zone)
		
		# Placer le joueur
		body.global_position = Vector2(64, 128)  # ou ta spawn_position
