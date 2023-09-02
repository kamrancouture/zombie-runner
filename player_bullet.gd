extends KinematicBody2D

var speed = 1000
var damage = 2



func _physics_process(delta):
	move_and_slide(Vector2(0 , speed).rotated(rotation))
	
	
	


func _on_Area2D_body_entered(body):
	body.health -= damage
	queue_free()
	




func _on_Timer_timeout():
	queue_free()
