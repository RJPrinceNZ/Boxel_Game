extends Node2D

var changing = false

func _on_Do_no_quit_pressed():
	print("do not quit")
	GameMenu.has_menu_open = false
	queue_free()

func _on_quit_pressed():
	GameMenu.has_menu_open = false
	changing = true
	queue_free()
	print("quit")
	
func _process(delta):
	if ShadowAnimation.finished_anim == true:
		if ShadowAnimation.current_animation == "Closing":
			if GameMenu.changing_tree == "Title":
				changing = false
				GameMenu.changing_tree == "idle"
				get_tree().change_scene("res://Menus/Title.tscn")
			if GameMenu.changing_tree == "Level":
				changing = false
				GameMenu.changing_tree == "idle"
				get_tree().change_scene("res://Menus/Level_Selection.tscn")
