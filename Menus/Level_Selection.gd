extends Node

var changing_tree = "idle"
var changing = false
var level = 0
var level_array = "CenterContainer/levels_Array"
var Locked = preload("res://sprites/Icon_Locked.png")

func _ready():
	changing = false
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()

func _process(delta):
	if PlayerStats.highest_level < 1:
		var Button_1 = get_node(level_array + "/Level_1/Button_1")
		Button_1.set_disabled(true)
		var Icon_1 = get_node(level_array + "/Level_1/TextureRect_1")
		Icon_1.set_texture(Locked)
		var Button_2 = get_node(level_array + "/Level_2/Button_2")
		Button_2.set_disabled(true)
		var Icon_2 = get_node(level_array + "/Level_2/TextureRect_2")
		Icon_2.set_texture(Locked)
		var Button_3 = get_node(level_array + "/Level_3/Button_3")
		Button_3.set_disabled(true)
		var Icon_3 = get_node(level_array + "/Level_3/TextureRect_3")
		Icon_3.set_texture(Locked)
	elif PlayerStats.highest_level < 2:
		var Button_2 = get_node(level_array + "/Level_2/Button_2")
		Button_2.set_disabled(true)
		var Icon_2 = get_node(level_array + "/Level_2/TextureRect_2")
		Icon_2.set_texture(Locked)
		var Button_3 = get_node(level_array + "/Level_3/Button_3")
		Button_3.set_disabled(true)
		var Icon_3 = get_node(level_array + "/Level_3/TextureRect_3")
		Icon_3.set_texture(Locked)
	elif PlayerStats.highest_level < 3:
		var Button_3 = get_node(level_array + "/Level_3/Button_3")
		Button_3.set_disabled(true)
		var Icon_3 = get_node(level_array + "/Level_3/TextureRect_3")
		Icon_3.set_texture(Locked)
	if changing == true:
		if ShadowAnimation.finished_anim == true:
			if changing_tree == "Title":
				get_tree().change_scene("res://Menus/Title.tscn")
			if changing_tree == "Level":
				get_tree().change_scene("res://Levels/game_levels/Level_" +str(level)+".tscn")
			
			
func _on_Button_Exit_pressed():
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Title"
	changing = true



func _on_Button_0_pressed():
	level = 0
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Level"
	changing = true


func _on_Button_1_pressed():
	level = 1
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Level"
	changing = true


func _on_Button_2_pressed():
	level = 2
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Level"
	changing = true




func _on_Button_3_pressed():
	level = 3
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Level"
	changing = true
