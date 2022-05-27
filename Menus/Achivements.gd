extends Node

var changing = false
var Escaped = preload("res://sprites/Icon_Achivement_Escape.png")
var Potato = preload("res://sprites/Icon_Achivement_Potato.png")
var Missed = preload("res://sprites/Icon_Achivement_You_Missed.png")

func _process(delta):
	if changing == true:
		if ShadowAnimation.finished_anim == true:
			get_tree().change_scene("res://Menus/Title.tscn")
	if PlayerStats.escaped == true:
		$CenterContainer/HBoxContainer/VBoxContainer/CenterContainer/Escaped/TextureRect.set_texture(Escaped)
	if PlayerStats.potato == true:
		$CenterContainer/HBoxContainer/VBoxContainer/CenterContainer3/Potato/TextureButton.set_normal_texture(Potato)
	if PlayerStats.missed == true:
		$CenterContainer/HBoxContainer/VBoxContainer/CenterContainer2/You_missed/TextureRect.set_texture(Missed)

func _ready():
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()
	GameMenu.active = false


func _on_Button_pressed():
	ShadowAnimation.new_animation = "Closing"
	ShadowAnimation.change_animation()
	changing = true


func _on_Escaped_mouse_entered():
	$CenterContainer/HBoxContainer/VBoxContainer/Label2.set_visible(true)


func _on_Escaped_mouse_exited():
	$CenterContainer/HBoxContainer/VBoxContainer/Label2.set_visible(false)


func _on_Potato_mouse_entered():
	$CenterContainer/HBoxContainer/VBoxContainer/Label3.set_visible(true)


func _on_Potato_mouse_exited():
	$CenterContainer/HBoxContainer/VBoxContainer/Label3.set_visible(false)


func _on_You_missed_mouse_entered():
	$CenterContainer/HBoxContainer/VBoxContainer/Label4.set_visible(true)


func _on_You_missed_mouse_exited():
	$CenterContainer/HBoxContainer/VBoxContainer/Label4.set_visible(false)


func _on_TextureButton_pressed():
	PlayerStats.missed = true
