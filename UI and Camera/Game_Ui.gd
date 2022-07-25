extends Control

func _on_TextureButton_pressed():
	if ShadowAnimation.finished_anim == true:
			PlayerStats.level_reset()
