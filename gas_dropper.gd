extends KinematicBody2D
var speed = 3
onready var player = get_parent().get_node("player")
onready var bullet = get_parent().get_node("player_bullet")
var damage = 80
var health = 1
var spawned = 10
func _physics_process(delta):
	print(spawned)
	
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



