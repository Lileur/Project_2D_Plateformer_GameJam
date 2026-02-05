extends Area2D

@export var kill_instantly: bool = true

func _ready():
	# Connexion automatique du signal (évite les oublis)
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)
		
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		if kill_instantly:
			kill_player(body)
			
func kill_player(player):
	if player.has_method("die"):
		player.die()
		
