extends Node

const SPAWN_RADIUS = 500

@export var enemy_scene: PackedScene


func _ready():
	$Timer.timeout.connect(on_timer_timeout)
	
	
func on_timer_timeout():
	var core = get_tree().get_first_node_in_group("core") as Core
	if core == null:
		return
		
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var spawn_position = core.global_position + (random_direction * SPAWN_RADIUS)
	
	var enemy = enemy_scene.instantiate() as Enemy
	
	var enemies_layer = get_tree().get_first_node_in_group("enemies_layer")
	enemies_layer.add_child(enemy)
	enemy.global_position = spawn_position
