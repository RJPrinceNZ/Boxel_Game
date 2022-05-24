extends Node

var changing = false

func _process(delta):
	if changing == true:
		if ShadowAnimation.finished_anim == true:
			get_tree().change_scene("res://Menus/Title.tscn")

func _ready():
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()


func _on_Button_pressed():
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing = true


func _on_Escaped_mouse_entered():
	pass # Replace with function body.
