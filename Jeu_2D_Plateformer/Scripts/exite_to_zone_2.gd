extends Area2D

@export var target_zone: PackedScene          # glisse ici zone_2.tscn
@export var spawn_position: Vector2 = Vector2.ZERO  # où le joueur apparaîtra dans Zone2

# Ce signal se déclenche quand un corps entre dans l'Area2D
func _on_body_entered(body: Node2D) -> void:
	# Vérifie que c'est bien le joueur
	if body.is_in_group("player"):
		var main = get_tree().current_scene          # récupère la scène principale
		var container = main.get_node("ZoneContainer")  # récupère le node qui contient les zones

		# Supprime la zone actuelle
		for child in container.get_children():
			child.queue_free()

		# Charge et ajoute la nouvelle zone
		var new_zone = target_zone.instantiate()
		container.add_child(new_zone)

		# Place le joueur à l'endroit défini
		body.global_position = spawn_position
