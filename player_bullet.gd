extends KinematicBody2D

var speed = 1000


func _physics_process(delta):
	move_and_slide(Vector2(0 , speed).rotated(rotation))
