extends Node

var changing = false

func _process(delta):
	if changing == true:
		if ShadowAnimation.finished_anim == true:
			get_tree().change_scene("res://Menus/Title.tscn")
	$CenterContainer/HBoxContainer/VBoxContainer/Sound.set_text("Sound Volume = " + str(SoundPlayer.vol*100))

func _ready():
	if PlayerStats.dark_background == true:
		$CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer/TextureButton.pressed = true
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()
	GameMenu.active = false
	$CenterContainer/HBoxContainer/VBoxContainer/Sound_slider.value = (SoundPlayer.vol)*100

func _on_Button_pressed():
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing = true


func _on_TextureButton_toggled(button_pressed):
	if $CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer/TextureButton.pressed == true:
		PlayerStats.dark_background = true
		print("dark_mode")
	if $CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer/TextureButton.pressed == false:
		PlayerStats.dark_background = false
		print("light_mode")


func _on_TextureButton_mouse_entered():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Hover_Button",false)


func _on_TextureButton_mouse_exited():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Unhover_Button",false)


func _on_Button_mouse_entered():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Hover_Button",false)

func _on_Button_mouse_exited():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Unhover_Button",false)


func _on_Music_toggle_toggled(button_pressed):
	if $CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer2/Music_toggle.pressed == true:
		MusicPlayer.change_music_db(0)
	if $CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer2/Music_toggle.pressed == false:
		MusicPlayer.change_music_db(2)


func _on_Music_toggle_mouse_entered():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Hover_Button",false)


func _on_Music_toggle_mouse_exited():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Unhover_Button",false)


func _on_Sound_slider_value_changed(value):
	SoundPlayer.set_volume(value/100)


func _on_Button_test_pressed():
	SoundPlayer.play_sound_effect("Fling",false)
