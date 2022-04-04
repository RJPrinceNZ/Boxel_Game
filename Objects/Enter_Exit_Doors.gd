extends Node2D


func _on_Exit_Area_body_entered(body):
	if body.is_in_group("Player"):
		PlayerStats.change_level()
