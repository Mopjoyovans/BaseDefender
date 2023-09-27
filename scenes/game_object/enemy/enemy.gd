extends CharacterBody2D
class_name Enemy

@export var attack_range: float = 20
@export var max_speed = 40

@onready var health_component: HealthComponent = $HealthComponent


func _process(delta):
	var direction = get_direction_to_core()
	velocity = direction * max_speed
	
	if velocity == Vector2.ZERO:
		enemy_attack_target()
	move_and_slide()
	
	
func get_direction_to_core():
	var core_node = get_tree().get_first_node_in_group("core") as Core
	if core_node != null and not is_enemy_in_range(core_node):
		return (core_node.global_position - global_position).normalized()
	return Vector2.ZERO


func is_enemy_in_range(target: Node2D):
	var distance_to_target = global_position.distance_to(target.global_position)
	return distance_to_target <= attack_range


func enemy_attack_target():
#	print("enemy attack target")
	var core_node = get_tree().get_first_node_in_group("core") as Core
	pass
