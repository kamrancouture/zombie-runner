extends KinematicBody2D
var Player_bullet = preload("res://player_bullet.tscn")

var speed = 500
var volasity = Vector2.ZERO
func _physics_process(delta):
	volasity = Input.get_vector("left_move","right_move","up_move","down_move") * speed
	if not volasity.x == 0 or not volasity.y == 0:
		$TankBodyDark.rotation = volasity.angle()
		$TankBodyDark.rotation -= deg2rad(90)
	move_and_slide(volasity)
	$TankDark.look_at(get_global_mouse_position())
	$TankDark.rotation -= deg2rad(90)
	
	
	var bullet = Player_bullet.instance()
	
