extends AnimationPlayer

func _ready():
	$death.global_position.x -= 26
	$death.global_position.y += 30

func move_up_cancel_glitch():
	$death.global_position.y -= 16
