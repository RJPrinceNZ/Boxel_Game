extends Control

#Variables
var can_change_animation = true
var opened = false
var active = false
var changing = false
var changing_tree = "idle"
var has_menu_open = false

onready var confirm = preload("res://Menus/Confirmation_ui.tscn")
#
#func _ready():
#	$AnimationPlayer.play("Closed")

func _process(delta):
	#Disabled if active variable is false, which is is only true if in a level
	if active == false:
		$AnimationPlayer.play("Closed")
		opened = false
#	#Escape key toggles the menu on or off.
	elif Input.is_action_just_pressed("in_game_menu") and can_change_animation == true:
		if opened == false:
			can_change_animation = true
			$AnimationPlayer.play("Opening")
			opened = true
		elif opened == true:
			$AnimationPlayer.play("Closing")
			can_change_animation = true
			opened = false
##To change scenes after transition is complete
	if changing == true:
		$AnimationPlayer.play("Closed")
	if ShadowAnimation.finished_anim == true:
		if ShadowAnimation.current_animation == "Closing":
			if changing_tree == "Title":
				changing = false
				changing_tree == "idle"
				get_tree().change_scene("res://Menus/Title.tscn")
			if changing_tree == "Level":
				changing = false
				changing_tree == "idle"
				get_tree().change_scene("res://Menus/Level_Selection.tscn")

#Detect when animation is completed
func _on_AnimationPlayer_animation_finished(anim_name):
	can_change_animation = true


func _ready():
	pass

#Buttons to quit and start transitions
func _on_Quit_Level_pressed():
	#ShadowAnimation.new_animation = "Closing"
	#ShadowAnimation.change_animation()
	#changing_tree = "Level"
	#changing = true
	if has_menu_open == false:
		has_menu_open = true
		var new_confirm = confirm.instance()
		new_confirm.global_transform = $CenterContainer/Position2D.global_transform
		add_child(new_confirm)
		changing_tree = "Level"



func _on_Quit_Menu_pressed():
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Title"
	changing = true
