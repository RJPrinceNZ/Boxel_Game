extends Node

var changing = false
var current_rez = Vector2(1280,720)

onready var ResOptionButton = $CenterContainer3/CenterContainer/HBoxContainer/VBoxContainer/Resolution/OptionButton

var Resolutions: Dictionary = {
	"3840x2160":Vector2(3840,2160),
	"2560x1440":Vector2(2560,1440),
	"1920x1080":Vector2(1920,1080),
	"1366x768":Vector2(1366,768),
	"1536x864":Vector2(1536,864),
	"1280x720":Vector2(1280,720),
	"1440x900":Vector2(1440,900),
	"1600x900":Vector2(1600,900),
	"1024x600":Vector2(1024,600)
	
	
	
	
	
}

func _process(delta):
	if changing == true:
		if ShadowAnimation.finished_anim == true:
			get_tree().change_scene("res://Menus/Title.tscn")
	$CenterContainer3/CenterContainer/HBoxContainer/VBoxContainer/Sound.set_text("Sound Volume = " + str(SoundPlayer.vol*200))
	$CenterContainer3/CenterContainer/HBoxContainer/VBoxContainer/Music.set_text("Music Volume = " + str(MusicPlayer.vol*200))
	
	var x = get_viewport().get_size().x
	var y = get_viewport().get_size().y
	var a = ((x/1280)+(y/720))/2
	$CenterContainer3.rect_scale = Vector2(a,a)
	$CenterContainer/CanvasLayer.scale = Vector2(a,a)
	
	
func _ready():
	AddResolutions()
	if PlayerStats.dark_background == true:
		$CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer/TextureButton.pressed = true
	if PlayerStats.fullscreen == true:
		$CenterContainer3/CenterContainer/HBoxContainer/VBoxContainer/FullScreen/Ful_Scr.pressed = true
		
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()
	GameMenu.active = false
	$CenterContainer3/CenterContainer/HBoxContainer/VBoxContainer/Sound_slider.value = (SoundPlayer.vol)*100
	$CenterContainer3/CenterContainer/HBoxContainer/VBoxContainer/Music_slide.value = (MusicPlayer.vol)*100
	

func AddResolutions():
	var current_rez = get_viewport().get_size()
	
	var Index = 0
	
	
	for r in Resolutions:
		ResOptionButton.add_item(r,Index)
		if Resolutions[r] == current_rez:
			ResOptionButton._select_int(Index)
		Index += 1

func _on_Button_pressed():
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing = true


func _on_TextureButton_toggled(button_pressed):
	if $CenterContainer3/CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer/TextureButton.pressed == true:
		PlayerStats.dark_background = true
		print("dark_mode")
	if $CenterContainer3/CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer/TextureButton.pressed == false:
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


func _on_OptionButton_item_selected(index):
	var size = Resolutions.get(ResOptionButton.get_item_text(index))
	OS.set_window_size(size)
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D,SceneTree.STRETCH_ASPECT_KEEP,size)
	#doesn't work with large resolutions


func _on_FulScr_toggled(button_pressed):
	if $CenterContainer3/CenterContainer/HBoxContainer/VBoxContainer/FullScreen/Ful_Scr.pressed == true:
		OS.window_fullscreen = true
		PlayerStats.fullscreen = true
	if $CenterContainer3/CenterContainer/HBoxContainer/VBoxContainer/FullScreen/Ful_Scr.pressed == false:
		OS.window_fullscreen = false
		PlayerStats.fullscreen = false
