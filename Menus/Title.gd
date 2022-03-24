extends Node

func _process(delta):
	pass

func _on_Settings_pressed():
	print("settings")


func _on_Play_pressed():
	print("Play")
	get_tree().change_scene("res://levels/game_levels/Level_0.tscn")

func _on_Credits_pressed():
	print("Credits")


func _on_Quit_pressed():
	print("Quit")
	get_tree().quit()

