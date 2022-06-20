extends Node2D

var changing = false
onready var text_label = $CanvasLayer/CenterContainer/CenterContainer/Position2D/VBoxContainer/Label

func _ready():
	PlayerStats.game_menus_open += 1
	$AnimationPlayer.play("Open")

func _process(delta):
	if GameMenu.changing_tree == "Title":
		text_label.set_text("Are you sure you want to quit to Main Menu? Your progress in Levels will not be saved.")
	if GameMenu.changing_tree == "Level":
		text_label.set_text("Are you sure you want to quit to Level Selection? Your progress in Levels will not be saved.")
	
func _on_Do_no_quit_pressed():
	GameMenu.has_menu_open = false
	$AnimationPlayer.play("Close")

func _on_quit_pressed():
	
	GameMenu.has_menu_open = false
	GameMenu.changing = true
	PlayerStats.game_menus_open += -1
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	$AnimationPlayer.play("Close")
	
#func _process(delta):
	#if ShadowAnimation.finished_anim == true:
		#if ShadowAnimation.current_animation == "Closing":
			#if GameMenu.changing_tree == "Title":
				#changing = false
				#GameMenu.changing_tree == "idle"
				#get_tree().change_scene("res://Menus/Title.tscn")
			#if GameMenu.changing_tree == "Level":
				#changing = false
				#GameMenu.changing_tree == "idle"
				#get_tree().change_scene("res://Menus/Level_Selection.tscn")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Close":
		PlayerStats.game_menus_open += -1
		queue_free()



func _on_Do_no_quit_mouse_entered():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Hover_Button",false)


func _on_Do_no_quit_mouse_exited():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Unhover_Button",false)


func _on_quit_mouse_entered():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Hover_Button",false)


func _on_quit_mouse_exited():
	if not ShadowAnimation.current_animation == "Title_Opening" and not ShadowAnimation.current_animation == "Closing":
		SoundPlayer.play_sound_effect("Unhover_Button",false)
