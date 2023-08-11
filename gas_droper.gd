extends KinematicBody2D
var speed = 3
onready var player = get_parent().get_node("player")
onready var bullet = get_parent().get_node("player_bullet")
var tuching_player = false
var damage = 80
var health = 2

func _physics_process(delta):
	if tuching_player == false:
		look_at(player.global_position)
		global_position += Vector2(speed , 0).rotated(rotation)
	

func _on_Area2D_body_entered(body):
	player.health -= damage
	bullet.bullet_damage =- health
	queue_free()