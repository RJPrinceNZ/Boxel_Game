extends Node

#variables
var changing_tree = "idle"
var changing = false
var level = 0
var level_array = "CenterContainer/Level_container/levels_Array"
var Locked = preload("res://sprites/Icon_Locked.png")


func _ready():
	#opening transition
	changing = false
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()
	#disable ingame menu
	GameMenu.active = false

func _process(delta):
	if PlayerStats.highest_level < 1:
		var Button_1 = get_node(level_array + "/Level_0_3/Level_1/CenterContainer/Button_1")
		Button_1.set_disabled(true)
		var Icon_1 = get_node(level_array + "/Level_0_3/Level_1/TextureRect_1")
		Icon_1.set_texture(Locked)
		var Button_2 = get_node(level_array + "/Level_0_3/Level_2/CenterContainer/Button_2")
		Button_2.set_disabled(true)
		var Icon_2 = get_node(level_array + "/Level_0_3/Level_2/TextureRect_2")
		Icon_2.set_texture(Locked)
		var Button_3 = get_node(level_array + "/Level_0_3/Level_3/CenterContainer/Button_3")
		Button_3.set_disabled(true)
		var Icon_3 = get_node(level_array + "/Level_0_3/Level_3/TextureRect_3")
		Icon_3.set_texture(Locked)
		var Button_4 = get_node(level_array + "/Level_4_7/Level_4/CenterContainer/Button_4")
		Button_4.set_disabled(true)
		var Icon_4 = get_node(level_array + "/Level_4_7/Level_4/TextureRect_4")
		Icon_4.set_texture(Locked)
		var Button_5 = get_node(level_array + "/Level_4_7/Level_5/CenterContainer/Button_5")
		Button_5.set_disabled(true)
		var Icon_5 = get_node(level_array + "/Level_4_7/Level_5/TextureRect_5")
		Icon_5.set_texture(Locked)
		var Button_6 = get_node(level_array + "/Level_4_7/Level_6/CenterContainer/Button_6")
		Button_6.set_disabled(true)
		var Icon_6 = get_node(level_array + "/Level_4_7/Level_6/TextureRect_6")
		Icon_6.set_texture(Locked)
		var Button_7 = get_node(level_array + "/Level_4_7/Level_7/CenterContainer/Button_7")
		Button_7.set_disabled(true)
		var Icon_7 = get_node(level_array + "/Level_4_7/Level_7/TextureRect_7")
		Icon_7.set_texture(Locked)
		var Button_8 = get_node(level_array + "/Level_8_11/Level_8/CenterContainer/Button_8")
		Button_8.set_disabled(true)
		var Icon_8 = get_node(level_array + "/Level_8_11/Level_8/TextureRect_8")
		Icon_8.set_texture(Locked)
		var Button_9 = get_node(level_array + "/Level_8_11/Level_9/CenterContainer/Button_9")
		Button_9.set_disabled(true)
		var Icon_9 = get_node(level_array + "/Level_8_11/Level_9/TextureRect_9")
		Icon_9.set_texture(Locked)
		var Button_10 = get_node(level_array + "/Level_8_11/Level_10/CenterContainer/Button_10")
		Button_10.set_disabled(true)
		var Icon_10 = get_node(level_array + "/Level_8_11/Level_10/TextureRect_10")
		Icon_10.set_texture(Locked)
	elif PlayerStats.highest_level < 2:
		var Button_2 = get_node(level_array + "/Level_0_3/Level_2/CenterContainer/Button_2")
		Button_2.set_disabled(true)
		var Icon_2 = get_node(level_array + "/Level_0_3/Level_2/TextureRect_2")
		Icon_2.set_texture(Locked)
		var Button_3 = get_node(level_array + "/Level_0_3/Level_3/CenterContainer/Button_3")
		Button_3.set_disabled(true)
		var Icon_3 = get_node(level_array + "/Level_0_3/Level_3/TextureRect_3")
		Icon_3.set_texture(Locked)
		var Button_4 = get_node(level_array + "/Level_4_7/Level_4/CenterContainer/Button_4")
		Button_4.set_disabled(true)
		var Icon_4 = get_node(level_array + "/Level_4_7/Level_4/TextureRect_4")
		Icon_4.set_texture(Locked)
		var Button_5 = get_node(level_array + "/Level_4_7/Level_5/CenterContainer/Button_5")
		Button_5.set_disabled(true)
		var Icon_5 = get_node(level_array + "/Level_4_7/Level_5/TextureRect_5")
		Icon_5.set_texture(Locked)
		var Button_6 = get_node(level_array + "/Level_4_7/Level_6/CenterContainer/Button_6")
		Button_6.set_disabled(true)
		var Icon_6 = get_node(level_array + "/Level_4_7/Level_6/TextureRect_6")
		Icon_6.set_texture(Locked)
		var Button_7 = get_node(level_array + "/Level_4_7/Level_7/CenterContainer/Button_7")
		Button_7.set_disabled(true)
		var Icon_7 = get_node(level_array + "/Level_4_7/Level_7/TextureRect_7")
		Icon_7.set_texture(Locked)
		var Button_8 = get_node(level_array + "/Level_8_11/Level_8/CenterContainer/Button_8")
		Button_8.set_disabled(true)
		var Icon_8 = get_node(level_array + "/Level_8_11/Level_8/TextureRect_8")
		Icon_8.set_texture(Locked)
		var Button_9 = get_node(level_array + "/Level_8_11/Level_9/CenterContainer/Button_9")
		Button_9.set_disabled(true)
		var Icon_9 = get_node(level_array + "/Level_8_11/Level_9/TextureRect_9")
		Icon_9.set_texture(Locked)
		var Button_10 = get_node(level_array + "/Level_8_11/Level_10/CenterContainer/Button_10")
		Button_10.set_disabled(true)
		var Icon_10 = get_node(level_array + "/Level_8_11/Level_10/TextureRect_10")
		Icon_10.set_texture(Locked)
	elif PlayerStats.highest_level < 3:
		var Button_3 = get_node(level_array + "/Level_0_3/Level_3/CenterContainer/Button_3")
		Button_3.set_disabled(true)
		var Icon_3 = get_node(level_array + "/Level_0_3/Level_3/TextureRect_3")
		Icon_3.set_texture(Locked)
		var Button_4 = get_node(level_array + "/Level_4_7/Level_4/CenterContainer/Button_4")
		Button_4.set_disabled(true)
		var Icon_4 = get_node(level_array + "/Level_4_7/Level_4/TextureRect_4")
		Icon_4.set_texture(Locked)
		var Button_5 = get_node(level_array + "/Level_4_7/Level_5/CenterContainer/Button_5")
		Button_5.set_disabled(true)
		var Icon_5 = get_node(level_array + "/Level_4_7/Level_5/TextureRect_5")
		Icon_5.set_texture(Locked)
		var Button_6 = get_node(level_array + "/Level_4_7/Level_6/CenterContainer/Button_6")
		Button_6.set_disabled(true)
		var Icon_6 = get_node(level_array + "/Level_4_7/Level_6/TextureRect_6")
		Icon_6.set_texture(Locked)
		var Button_7 = get_node(level_array + "/Level_4_7/Level_7/CenterContainer/Button_7")
		Button_7.set_disabled(true)
		var Icon_7 = get_node(level_array + "Level_4_7/Level_7/TextureRect_7")
		Icon_7.set_texture(Locked)
		var Button_8 = get_node(level_array + "/Level_8_11/Level_8/CenterContainer/Button_8")
		Button_8.set_disabled(true)
		var Icon_8 = get_node(level_array + "/Level_8_11/Level_8/TextureRect_8")
		Icon_8.set_texture(Locked)
		var Button_9 = get_node(level_array + "/Level_8_11/Level_9/CenterContainer/Button_9")
		Button_9.set_disabled(true)
		var Icon_9 = get_node(level_array + "/Level_8_11/Level_9/TextureRect_9")
		Icon_9.set_texture(Locked)
		var Button_10 = get_node(level_array + "/Level_8_11/Level_10/CenterContainer/Button_10")
		Button_10.set_disabled(true)
		var Icon_10 = get_node(level_array + "/Level_8_11/Level_10/TextureRect_10")
		Icon_10.set_texture(Locked)
	elif PlayerStats.highest_level < 4:
		var Button_4 = get_node(level_array + "/Level_4_7/Level_4/CenterContainer/Button_4")
		Button_4.set_disabled(true)
		var Icon_4 = get_node(level_array + "/Level_4_7/Level_4/TextureRect_4")
		Icon_4.set_texture(Locked)
		var Button_5 = get_node(level_array + "/Level_4_7/Level_5/CenterContainer/Button_5")
		Button_5.set_disabled(true)
		var Icon_5 = get_node(level_array + "/Level_4_7/Level_5/TextureRect_5")
		Icon_5.set_texture(Locked)
		var Button_6 = get_node(level_array + "/Level_4_7/Level_6/CenterContainer/Button_6")
		Button_6.set_disabled(true)
		var Icon_6 = get_node(level_array + "/Level_4_7/Level_6/TextureRect_6")
		Icon_6.set_texture(Locked)
		var Button_7 = get_node(level_array + "/Level_4_7/Level_7/CenterContainer/Button_7")
		Button_7.set_disabled(true)
		var Icon_7 = get_node(level_array + "/Level_4_7/Level_7/TextureRect_7")
		Icon_7.set_texture(Locked)
		var Button_8 = get_node(level_array + "/Level_8_11/Level_8/CenterContainer/Button_8")
		Button_8.set_disabled(true)
		var Icon_8 = get_node(level_array + "/Level_8_11/Level_8/TextureRect_8")
		Icon_8.set_texture(Locked)
		var Button_9 = get_node(level_array + "/Level_8_11/Level_9/CenterContainer/Button_9")
		Button_9.set_disabled(true)
		var Icon_9 = get_node(level_array + "/Level_8_11/Level_9/TextureRect_9")
		Icon_9.set_texture(Locked)
		var Button_10 = get_node(level_array + "/Level_8_11/Level_10/CenterContainer/Button_10")
		Button_10.set_disabled(true)
		var Icon_10 = get_node(level_array + "/Level_8_11/Level_10/TextureRect_10")
		Icon_10.set_texture(Locked)
	elif PlayerStats.highest_level < 5:
		var Button_5 = get_node(level_array + "/Level_4_7/Level_5/CenterContainer/Button_5")
		Button_5.set_disabled(true)
		var Icon_5 = get_node(level_array + "/Level_4_7/Level_5/TextureRect_5")
		Icon_5.set_texture(Locked)
		var Button_6 = get_node(level_array + "/Level_4_7/Level_6/CenterContainer/Button_6")
		Button_6.set_disabled(true)
		var Icon_6 = get_node(level_array + "/Level_4_7/Level_6/TextureRect_6")
		Icon_6.set_texture(Locked)
		var Button_7 = get_node(level_array + "/Level_4_7/Level_7/CenterContainer/Button_7")
		Button_7.set_disabled(true)
		var Icon_7 = get_node(level_array + "/Level_4_7/Level_7/TextureRect_7")
		Icon_7.set_texture(Locked)
		var Button_8 = get_node(level_array + "/Level_8_11/Level_8/CenterContainer/Button_8")
		Button_8.set_disabled(true)
		var Icon_8 = get_node(level_array + "/Level_8_11/Level_8/TextureRect_8")
		Icon_8.set_texture(Locked)
		var Button_9 = get_node(level_array + "/Level_8_11/Level_9/CenterContainer/Button_9")
		Button_9.set_disabled(true)
		var Icon_9 = get_node(level_array + "/Level_8_11/Level_9/TextureRect_9")
		Icon_9.set_texture(Locked)
		var Button_10 = get_node(level_array + "/Level_8_11/Level_10/CenterContainer/Button_10")
		Button_10.set_disabled(true)
		var Icon_10 = get_node(level_array + "/Level_8_11/Level_10/TextureRect_10")
		Icon_10.set_texture(Locked)
	elif PlayerStats.highest_level < 6:
		var Button_6 = get_node(level_array + "/Level_4_7/Level_6/CenterContainer/Button_6")
		Button_6.set_disabled(true)
		var Icon_6 = get_node(level_array + "/Level_4_7/Level_6/TextureRect_6")
		Icon_6.set_texture(Locked)
		var Button_7 = get_node(level_array + "/Level_4_7/Level_7/CenterContainer/Button_7")
		Button_7.set_disabled(true)
		var Icon_7 = get_node(level_array + "/Level_4_7/Level_7/TextureRect_7")
		Icon_7.set_texture(Locked)
		var Button_8 = get_node(level_array + "/Level_8_11/Level_8/CenterContainer/Button_8")
		Button_8.set_disabled(true)
		var Icon_8 = get_node(level_array + "/Level_8_11/Level_8/TextureRect_8")
		Icon_8.set_texture(Locked)
		var Button_9 = get_node(level_array + "/Level_8_11/Level_9/CenterContainer/Button_9")
		Button_9.set_disabled(true)
		var Icon_9 = get_node(level_array + "/Level_8_11/Level_9/TextureRect_9")
		Icon_9.set_texture(Locked)
		var Button_10 = get_node(level_array + "/Level_8_11/Level_10/CenterContainer/Button_10")
		Button_10.set_disabled(true)
		var Icon_10 = get_node(level_array + "/Level_8_11/Level_10/TextureRect_10")
		Icon_10.set_texture(Locked)
	elif PlayerStats.highest_level < 7:
		var Button_7 = get_node(level_array + "Level_4_7/Level_7/CenterContainer/Button_7")
		Button_7.set_disabled(true)
		var Icon_7 = get_node(level_array + "Level_4_7/Level_7/TextureRect_7")
		Icon_7.set_texture(Locked)
		var Button_8 = get_node(level_array + "/Level_8_11/Level_8/CenterContainer/Button_8")
		Button_8.set_disabled(true)
		var Icon_8 = get_node(level_array + "/Level_8_11/Level_8/TextureRect_8")
		Icon_8.set_texture(Locked)
		var Button_9 = get_node(level_array + "/Level_8_11/Level_9/CenterContainer/Button_9")
		Button_9.set_disabled(true)
		var Icon_9 = get_node(level_array + "/Level_8_11/Level_9/TextureRect_9")
		Icon_9.set_texture(Locked)
		var Button_10 = get_node(level_array + "/Level_8_11/Level_10/CenterContainer/Button_10")
		Button_10.set_disabled(true)
		var Icon_10 = get_node(level_array + "/Level_8_11/Level_10/TextureRect_10")
		Icon_10.set_texture(Locked)
	elif PlayerStats.highest_level < 8:
		var Button_8 = get_node(level_array + "/Level_8_11/Level_8/CenterContainer/Button_8")
		Button_8.set_disabled(true)
		var Icon_8 = get_node(level_array + "/Level_8_11/Level_8/TextureRect_8")
		Icon_8.set_texture(Locked)
		var Button_9 = get_node(level_array + "/Level_8_11/Level_9/CenterContainer/Button_9")
		Button_9.set_disabled(true)
		var Icon_9 = get_node(level_array + "/Level_8_11/Level_9/TextureRect_9")
		Icon_9.set_texture(Locked)
		var Button_10 = get_node(level_array + "/Level_8_11/Level_10/CenterContainer/Button_10")
		Button_10.set_disabled(true)
		var Icon_10 = get_node(level_array + "/Level_8_11/Level_10/TextureRect_10")
		Icon_10.set_texture(Locked)
	elif PlayerStats.highest_level < 9:
		var Button_9 = get_node(level_array + "/Level_8_11/Level_9/CenterContainer/Button_9")
		Button_9.set_disabled(true)
		var Icon_9 = get_node(level_array + "/Level_8_11/Level_9/TextureRect_9")
		Icon_9.set_texture(Locked)
		var Button_10 = get_node(level_array + "/Level_8_11/Level_10/CenterContainer/Button_10")
		Button_10.set_disabled(true)
		var Icon_10 = get_node(level_array + "/Level_8_11/Level_10/TextureRect_10")
		Icon_10.set_texture(Locked)
	elif PlayerStats.highest_level < 10:
		var Button_10 = get_node(level_array + "/Level_8_11/Level_10/CenterContainer/Button_10")
		Button_10.set_disabled(true)
		var Icon_10 = get_node(level_array + "/Level_8_11/Level_10/TextureRect_10")
		Icon_10.set_texture(Locked)

	#The Part above disables level selection buttons, the part beneath activates the transition.
	if changing == true:
		if ShadowAnimation.finished_anim == true:
			if changing_tree == "Title":
				get_tree().change_scene("res://Menus/Title.tscn")
			if changing_tree == "Level":
				get_tree().change_scene("res://Levels/game_levels/Level_" +str(level)+".tscn")
			
#Exit to main menu button
func _on_Button_Exit_pressed():
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Title"
	changing = true

#Every level button when pressed
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


func _on_Button_4_pressed():
	level = 4
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Level"
	changing = true


func _on_Button_5_pressed():
	level = 5
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Level"
	changing = true


func _on_Button_6_pressed():
	level = 6
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Level"
	changing = true


func _on_Button_7_pressed():
	level = 7
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Level"
	changing = true


func _on_Button_8_pressed():
	level = 8
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Level"
	changing = true


func _on_Button_9_pressed():
	level = 9
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Level"
	changing = true


func _on_Button_10_pressed():
	level = 10
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Level"
	changing = true
