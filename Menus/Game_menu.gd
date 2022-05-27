extends Control

var current_animation = "Closed"
var new_animation = "Closed"
var can_change_animation = true
var opened = false
var active = false
var changing = false
var changing_tree = "idle"

func _ready():
	$AnimationPlayer.play("Closed")

func _process(delta):
	print(ShadowAnimation.finished_anim)
	if active == false:
		$AnimationPlayer.play("Closed")
		opened = false
	elif Input.is_action_just_pressed("in_game_menu") and can_change_animation == true:
		if opened == false:
			can_change_animation = true
			$AnimationPlayer.play("Opening")
			opened = true
		elif opened == true:
			$AnimationPlayer.play("Closing")
			can_change_animation = true
			opened = false
	if changing == true:
		$AnimationPlayer.play("Closed")
		if ShadowAnimation.finished_anim == true:
			if changing_tree == "Title":
				changing = false
				get_tree().change_scene("res://Menus/Title.tscn")
			if changing_tree == "Level":
				changing = false
				get_tree().change_scene("res://Menus/Level_Selection.tscn")

func _on_AnimationPlayer_animation_finished(anim_name):
	can_change_animation = true


func _on_Quit_Level_pressed():
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Level"
	changing = true


func _on_Quit_Menu_pressed():
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Title"
	changing = true
