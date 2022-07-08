extends Node

var changing = false
var current_rez = 1
var rez_1 = Vector2(1280,720)
var rez_2 = Vector2(1920,1080)



func _process(delta):
	if changing == true:
		if ShadowAnimation.finished_anim == true:
			get_tree().change_scene("res://Menus/Title.tscn")
	$CenterContainer/HBoxContainer/VBoxContainer/Sound.set_text("Sound Volume = " + str(SoundPlayer.vol*200))
	$CenterContainer/HBoxContainer/VBoxContainer/Music.set_text("Music Volume = " + str(MusicPlayer.vol*200))

func _ready():
	if PlayerStats.dark_background == true:
		$CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer/TextureButton.pressed = true
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()
	GameMenu.active = false
	$CenterContainer/HBoxContainer/VBoxContainer/Sound_slider.value = (SoundPlayer.vol)*100
	$CenterContainer/HBoxContainer/VBoxContainer/Music_slide.value = (MusicPlayer.vol)*100

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



func _on_Sound_slider_value_changed(value):
	SoundPlayer.set_volume(value/100)



func _on_Music_slide_value_changed(value):
	MusicPlayer.set_volume(value/100)


func _on_Left_pressed():
	current_rez += -1
	if current_rez < 1:
		current_rez = 2
	if current_rez == 1:
		OS.set_window_size(rez_1)
	if current_rez == 2:
		OS.set_window_size(rez_2)

func _on_Right_pressed():
	current_rez += +1
	if current_rez > 2:
		current_rez = 1
	if current_rez == 1:
		OS.set_window_size(rez_1)
	if current_rez == 2:
		OS.set_window_size(rez_2)

