extends KinematicBody2D
var speed = 5
onready var player = get_parent().get_node("player")

func _physics_process(delta):
	
	global_position += Vector2(speed , 0).rotated(rotation)
