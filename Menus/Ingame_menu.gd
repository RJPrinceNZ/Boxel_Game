extends Control

var changing = false
var changing_tree = "idle"
var enabled = false
var opened = false

var current_animation = "Disappeared"
var new_animation = "Disappeared"
var can_change_animation = true
var finished_anim = false


func _ready():
	changing = false
	var changing_tree = "idle"
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()
	
	 
func _process(delta):
	if enabled == false:
		$AnimationPlayer.play("Disappeared")
	if enabled == true:
		if Input.is_action_just_pressed("in_game_menu"):
			if opened == false:
				opened = true
			elif opened == true:
				opened = false
	if changing == true:
		if ShadowAnimation.finished_anim == true:
			if changing_tree == "Title":
				get_tree().change_scene("res://Menus/Title.tscn")
			if changing_tree == "Level":
				get_tree().change_scene("res://Menus/Level_Selection.tscn")


func _on_Quit_Main_pressed():
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Title"
	changing = true

func _on_Quit_Level_pressed():
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing_tree = "Level"
	changing = true

