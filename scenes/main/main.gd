extends Node


func _ready():
	%Core.health_component.died.connect(on_core_died)
	
	
func on_core_died():
	print("GAME OVER")
