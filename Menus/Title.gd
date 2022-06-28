extends Node

var changing_tree = "idle"
var changing = false


func _ready():
	changing = false
	if PlayerStats.opened_before == false:
		ShadowAnimation.new_animation = "Title_Opening"
		ShadowAnimation.change_animation()
		PlayerStats.opened_before = true
	else:
		ShadowAnimation.new_animation = "Opening"
		ShadowAnimation.change_animation()
	GameMenu.active = false
	PlayerStats.in_level = false
	
	
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


func _on_Play_mouse_entered():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Hover_Button",false)

func _on_Play_mouse_exited():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Unhover_Button",false)

func _on_Settings_mouse_entered():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Hover_Button",false)

func _on_Settings_mouse_exited():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Unhover_Button",false)

func _on_Credits_mouse_entered():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Hover_Button",false)

func _on_Credits_mouse_exited():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Unhover_Button",false)

func _on_Quit_mouse_entered():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Hover_Button",false)

func _on_Quit_mouse_exited():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Unhover_Button",false)

func _on_TextureButton_mouse_entered():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Hover_Button",false)

func _on_TextureButton_mouse_exited():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Unhover_Button",false)
