extends Node
class_name Shield

@onready var health_component: HealthComponent = $HealthComponent


func _ready():
	health_component.health_changed.connect(on_health_changed)
	
	
func damage(damage_amount: float):
	print("check deal shield damage")
	health_component.damage(damage_amount)
	
	
func on_health_changed():
	pass
