extends Node

var has_gun = true
var current_level = 0
var level_count = 2

func change_level():
	current_level += 1
	print (current_level)
	if current_level <= level_count:
		get_tree().change_scene("res://Levels/game_levels/Level_" +str(current_level)+".tscn")
	else:
		get_tree().quit()

func level_reset():
	get_tree().change_scene("res://Levels/game_levels/Level_" +str(current_level)+".tscn")
	
