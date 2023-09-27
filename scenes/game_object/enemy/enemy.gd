extends CharacterBody2D
class_name Enemy

const MAX_SPEED = 40

@onready var health_component: HealthComponent = $HealthComponent


func _process(delta):
	var direction = get_direction_to_core()
	velocity = direction * MAX_SPEED
	move_and_slide()
	
	
func get_direction_to_core():
	var core_node = get_tree().get_first_node_in_group("core") as Core
	if core_node != null:
		return (core_node.global_position - global_position).normalized()
	return Vector2.ZERO
