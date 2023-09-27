extends Node
class_name Shield

@onready var health_component: HealthComponent = $HealthComponent


func _ready():
	health_component.health_changed.connect(on_health_changed)
	
	
func check_deal_damage():
	print("check deal shield damage")
	health_component.damage(1)
	
	
func on_health_changed():
	pass
