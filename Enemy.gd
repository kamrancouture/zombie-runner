extends KinematicBody2D

var can_shoot = true
var fire_rate = 0.5
var player = get_parent().get_node("player")
var Bullet = preload("res://Enemy_Rocket.tscn")

func _physics_process(delta):
	
	look_at(player)
	
	if can_shoot:
		shoot()



func shoot():
	var bullet = Bullet.instance()
	bullet.global_position = $Bullet_spawn.global_position
	bullet.global_rotation = global_rotation
	get_parent().add_child(bullet)
