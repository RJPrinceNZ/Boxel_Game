extends Node

var changing = false

func _process(delta):
	if changing == true:
		if ShadowAnimation.finished_anim == true:
			get_tree().change_scene("res://Menus/Title.tscn")

	var x = get_viewport().get_size().x
	var y = get_viewport().get_size().y
	var a = ((x/1280)+(y/720))/2
	$CenterContainer3.rect_scale = Vector2(a,a)
	$CenterContainer2/CanvasLayer.scale = Vector2(a,a)



func _ready():
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()
	GameMenu.active = false

func _on_LinkButton_pressed():
	OS.shell_open("https://www.youtube.com/channel/UC_c8-ABAqDEemidFQxz9K6Q")


func _on_Button_pressed():
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing = true



func _on_Button_mouse_entered():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Hover_Button",false)


func _on_Button_mouse_exited():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Unhover_Button",false)


func _on_LinkButton_mouse_entered():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Hover_Button",false)


func _on_LinkButton_mouse_exited():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Unhover_Button",false)
