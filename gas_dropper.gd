extends KinematicBody2D
var speed = 3
onready var player = get_parent().get_node("player")
onready var bullet = get_parent().get_node("player_bullet")
var damage = 80
var health = 1
var spawned = 10
var Mine = preload("res://gas_dropper_mine.tscn")
func _physics_process(delta):
	
	
	
	
	if health <= 0:
		queue_free()
		if spawned >= 0:
			var gas_dropper = self.duplicate()
			gas_dropper.global_position = Vector2.ZERO
			get_parent().add_child(gas_dropper)
			gas_dropper.spawned = spawned - 1
		
	
	
	if not Global.player_dead:
		
		
		
		
		
		look_at(player.global_position)
		global_position += Vector2(speed , 0).rotated(rotation)
		
		


func _on_Area2D_body_entered(body):
	player.health -= damage
	var gas_dropper = self.duplicate()
	gas_dropper.global_position = Vector2.ZERO
	get_parent().add_child(gas_dropper)
	queue_free()
	spawned -= 1


func spund_mine():
	var mine = Mine.instance()
	mine.global_position = $TankRedOutline.global_position
	get_parent().add_child(mine)




func _on_Timer_timeout():
	spund_mine()
