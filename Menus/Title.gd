extends Node

var changing_tree = "idle"
var changing = false

func _ready():
	changing = false
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()
	GameMenu.active = false
	
func _process(delta):
	if changing == true:
		if ShadowAnimation.finished_anim == true:
			if changing_tree == "Play":
				get_tree().change_scene("res://Menus/Level_Selection.tscn")
			if changing_tree == "Credits":
				get_tree().change_scene("res://Menus/Credits.tscn")
			if changing_tree == "Settings":
				get_tree().change_scene("res://Menus/Settings.tscn")
			if changing_tree == "Achievements":
				get_tree().change_scene("res://Menus/Achivements.tscn")
		

func _on_Settings_pressed():
	print("settings")
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Settings"
	changing = true

func _on_Play_pressed():
	print("Play")
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Play"
	changing = true
	

func _on_Credits_pressed():
	print("Credits")
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Credits"
	changing = true


func _on_Quit_pressed():
	print("Quit")
	get_tree().quit()


func _on_TextureButton_pressed():
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Achievements"
	changing = true
