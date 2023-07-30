extends KinematicBody2D
var Player_bullet = preload("res://player_bullet.tscn")

var speed = 500
var volasity = Vector2.ZERO
func _physics_process(delta):
	volasity = Input.get_vector("left_move","right_move","up_move","down_move") * speed
	move_and_slide(volasity)
	look_at(get_global_mouse_position())
	
	
	var bullet = Player_bullet.instance()
	
