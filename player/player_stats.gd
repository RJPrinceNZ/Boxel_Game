extends Node

var has_gun = true
var current_level = 0
var level_count = 9
var number_held = 0
var highest_level = 0
var can_pick = true
var ui_block = false


var escaped = false
var potato = false
var missed = false


func change_level():
	current_level += 1
	if current_level > highest_level:
		highest_level = current_level
	if current_level <= level_count:
		get_tree().change_scene("res://Levels/game_levels/Level_" +str(current_level)+".tscn")
	else:
		escaped = true
		get_tree().change_scene("res://Menus/Title.tscn")

func level_reset():
	get_tree().change_scene("res://Levels/game_levels/Level_" +str(current_level)+".tscn")
	
