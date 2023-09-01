extends KinematicBody2D
var speed = 3
onready var player = get_parent().get_node("player")
onready var bullet = get_parent().get_node("player_bullet")
var damage = 80
var health = 1

var respound = true

func _physics_process(delta):
	
#	if respound == true:
#		get_parent().add_child()
	
	if not Global.player_dead:
		
		
		
		
		look_at(player.global_position)
		global_position += Vector2(speed , 0).rotated(rotation)
		
		


func _on_Area2D_body_entered(body):
	player.health -= damage
	queue_free()
	respound = true

func _on_Area2D2_body_entered(body):
	queue_free()
	respound = true
