extends Area2D

var homing_power = 0.25
var speed = 10
var player = get_parent().get_node("player")

func _physics_process(delta):
	
	if global_position.get_angle_to(player.global_position) < 0:
		rotate(deg2rad(-homing_power))
	elif global_position.get_angle_to(player.global_position) > 0:
		rotate(deg2rad(homing_power))
	
	global_position += Vector2(0 , speed).rotated(rotation)
