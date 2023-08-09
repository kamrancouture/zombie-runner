extends KinematicBody2D


var can_shoot = true
var fire_rate = 1
onready var player = get_parent().get_node("player")
var Bullet = preload("res://Enemy_Rocket.tscn")

func _physics_process(delta):
	
	look_at(player.global_position)
	global_rotation - rad2deg(.5)
	
	if can_shoot:
		can_shoot = false
		shoot()
		$fire_rate.start(fire_rate)


func shoot():
	var bullet = Bullet.instance()
	bullet.global_position = $Bullet_spawn.global_position
	bullet.global_rotation = $rocket_launcher.global_rotation
	bullet.global_rotation -= deg2rad(90)
	get_parent().add_child(bullet)


func _on_fire_rate_timeout():
	can_shoot = true
