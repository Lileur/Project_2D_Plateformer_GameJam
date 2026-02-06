extends Node
var parent = get_parent() as Node2D

@export var zone_container_path := NodePath("ZoneContainer")
var zone_container: Node

func _ready():
	zone_container = get_tree().current_scene.get_node(zone_container_path)
	
func change_zone_deferred(scene_path: String, spawn_position: Vector2):
	# Supprimer la zone actuelle
	for child in zone_container.get_children():
		child.queue_free()

	# Charger la nouvelle zone
	var new_zone = load(scene_path).instantiate()
	zone_container.add_child(new_zone)

	# Déplacer le joueur
	var player = get_tree().current_scene.get_node("Player/CharacterBody2D")
	player.global_position = spawn_position

func change_zone(scene_path: String, spawn_position: Vector2):
	call_deferred("change_zone_deferred", scene_path, spawn_position)
