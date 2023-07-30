extends Area2D

var homing_power = 0.5
var speed = 10
onready var player = get_parent().get_node("player")

func _physics_process(delta):
	
	if get_angle_to(player.global_position) < 0:
		rotate(deg2rad(homing_power))
	elif get_angle_to(player.global_position) > 0:
		rotate(deg2rad(-homing_power))
	
	global_position += Vector2(0 , -speed).rotated(rotation)
