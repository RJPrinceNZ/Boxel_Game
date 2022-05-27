extends Node

var changing = false

func _process(delta):
	if changing == true:
		if ShadowAnimation.finished_anim == true:
			get_tree().change_scene("res://Menus/Title.tscn")



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

