extends CharacterBody2D
class_name Core

@onready var damage_interval_timer: Timer = $DamageIntervalTimer
@onready var health_component: HealthComponent = $HealthComponent

var number_colliding_bodies = 0


func _ready():
	$CollisionArea2D.body_entered.connect(on_body_entered)
	$CollisionArea2D.body_exited.connect(on_body_exited)
	damage_interval_timer.timeout.connect(on_damage_interval_timer_timeout)
	health_component.health_changed.connect(on_health_changed)
	
	
func check_deal_damage():
	print("check deal damage")
	print(number_colliding_bodies)
	if number_colliding_bodies == 0 or not damage_interval_timer.is_stopped():
		return
		
	print("deal damage")
	health_component.damage(1)
	damage_interval_timer.start()
	
	
func on_body_entered(other_body: Node2D):
	print("body entered")
	number_colliding_bodies += 1
	check_deal_damage()
	
	
func on_body_exited(other_body: Node2D):
	number_colliding_bodies -= 1
	
	
func on_damage_interval_timer_timeout():
	check_deal_damage()


func on_health_changed():
	pass
