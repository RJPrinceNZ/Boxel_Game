extends Node

var changing_tree = "idle"
var changing = true

func _ready():
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()
	
func _process(delta):
	if changing == true:
		if ShadowAnimation.finished_anim == true:
			if changing_tree == "Play":
				get_tree().change_scene("res://levels/game_levels/Level_0.tscn")
		

func _on_Settings_pressed():
	print("settings")


func _on_Play_pressed():
	print("Play")
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Play"
	changing = true
	

func _on_Credits_pressed():
	print("Credits")


func _on_Quit_pressed():
	print("Quit")
	get_tree().quit()



