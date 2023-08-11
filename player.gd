extends KinematicBody2D


var fire_rate = .25
var Explosion_Death = preload("res://player_death_explosion.tscn")
var Player_bullet = preload("res://player_bullet.tscn")
var health = 100
var can_shoot = true
var speed = 500
var velocity = Vector2.ZERO

func _ready():
	$TankBodyDark.show()
	$TankDark.show()
	$death.hide()
func _physics_process(delta):
	if not Global.player_dead:
		if health <= 0:
			Global.player_dead = true
			hide()
			var explosion_death = Explosion_Death.instance()
			explosion_death.get_node("death").global_position = global_position
			explosion_death.play("death")
			get_parent().add_child(explosion_death)
			
			
		
		if Input.is_action_pressed("shoot") and can_shoot:
			can_shoot = false
			shoot()
			$fire_rate.start()
		
		velocity = Input.get_vector("left_move","right_move","up_move","down_move") * speed
		if not velocity.x == 0 or not velocity.y == 0:
			$TankBodyDark.rotation = velocity.angle()
			$TankBodyDark.rotation -= deg2rad(90)
		velocity = move_and_slide(velocity)
		$TankDark.look_at(get_global_mouse_position())
		$TankDark.rotation -= deg2rad(90)
		
		
		var bullet = Player_bullet.instance()



func shoot():
	var player_bullet = Player_bullet.instance()
	player_bullet.global_position = $TankDark/bullet_spawn.global_position
	player_bullet.global_rotation = $TankDark.global_rotation
	get_parent().add_child(player_bullet)


func _on_fire_rate_timeout():
	can_shoot = true
