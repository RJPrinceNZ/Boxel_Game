extends Node2D

var changing = false

func _process(delta):
	if changing == true:
		if ShadowAnimation.finished_anim == true:
			PlayerStats.change_level()

func _on_Exit_Area_body_entered(body):
	if body.is_in_group("Player"):
		ShadowAnimation.new_animation = "Closing"
		ShadowAnimation.change_animation()
		changing = true 
