extends Area2D

var damage = 25
var homing_power = 1
var speed = 7
onready var player = get_parent().get_node("player")

func _ready():
	$AnimatedSprite.play("bullet")



func _physics_process(delta):
	if Global.player_dead == false:
		if get_angle_to(player.global_position) > 0:
			rotate(deg2rad(homing_power))
		elif get_angle_to(player.global_position) < 0:
			rotate(deg2rad(-homing_power))
		
		global_position += Vector2(speed , 0).rotated(rotation)


func _on_disippear_timer_timeout():
	queue_free()


func _on_Enemy_Rocket_body_entered(body):
	set_physics_process(false)
	player.health -= damage
	$AnimationPlayer.play("explode")
	yield($AnimationPlayer , "animation_finished")
	queue_free()
