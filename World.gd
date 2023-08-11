extends Node2D


func _physics_process(delta):
	$Camera2D.global_position = $player.global_position
