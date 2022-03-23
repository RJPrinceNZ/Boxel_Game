extends Node

var has_gun = true
var current_level = 0
var level_count = 1

func change_level():
	current_level += 1
	if current_level <= level_count:
		get_tree().change_scene("res://Other/Levels/game_levels/Level_" +str(current_level)+".tscn")
	else:
		get_tree().quit()
