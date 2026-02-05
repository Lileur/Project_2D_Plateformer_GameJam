extends CharacterBody2D

@export var speed := 50.0
@export var gravity := 900.0
@export var direction := -1   # -1 = gauche, 1 = droite

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var attacking: bool = false
var player_detected: Node2D = null
@export var chase_speed := 120.0

func _ready():
	sprite.play("idle")

func _physics_process(delta):
	# Gravité
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0

	if player_detected:
		# Aller vers le joueur
		if player_detected.global_position.x > global_position.x:
			direction = 1
		else:
			direction = -1
		velocity.x = direction * chase_speed
	else:
		# Patrouille normale
		velocity.x = direction * speed
		# Inverser la direction si on touche un mur


	
	if attacking:
		sprite.play("attack")
	elif abs(velocity.x) > 1:
		sprite.play("move")
	else:
		sprite.play("idle")

	move_and_slide()
	if is_on_wall():
		direction *= -1





	# Orientation du sprite
	sprite.flip_h = direction > 0


func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		attacking = true
		sprite.play("attack")
		await (sprite) # attend la fin de l'animation
		attacking = false
		if body.has_method("die"):
			body.die()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_detected = body
		speed += 50
		
func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == player_detected:
		player_detected = null
		speed -= 50
		
