extends Control

var Escaped = preload("res://sprites/Icon_Achivement_Escape.png")
var Potato = preload("res://sprites/Icon_Achivement_Potato.png")
var Missed = preload("res://sprites/Icon_Achivement_You_Missed.png")
var Firepower = preload("res://sprites/Icon_Achivement_Firepower.png")

func _ready():
	$AnimationPlayer.play("Closed")

func _process(delta):
	var x = get_viewport().get_size().x
	var y = get_viewport().get_size().y
	var a = ((x/1280)+(y/720))/2
	$CanvasLayer.scale = Vector2(a,a)
	

func achievement_get(achievement):
	if achievement == "Escaped":
		$CanvasLayer/ColorRect/HBoxContainer/VBoxContainer/HBoxContainer/TextureRect.set_texture(Escaped)
		$CanvasLayer/ColorRect/HBoxContainer/Label.set_text("Achivement Unlocked: Escaped")
		$CanvasLayer/CenterContainer2/CenterContainer/ColorRect/HBoxContainer/Label2.set_text("You escaped the facility, but what is your next step?")
	if achievement == "Potato":
		$CanvasLayer/ColorRect/HBoxContainer/VBoxContainer/HBoxContainer/TextureRect.set_texture(Potato)
		$CanvasLayer/ColorRect/HBoxContainer/Label.set_text("Achivement Unlocked: Potato")
		$CanvasLayer/ColorRect/HBoxContainer/Label2.set_text("The potato! The classic food, but also a joke from where I'm from, eheh, it's funny. - RJ")
	if achievement == "Missed":
		$CanvasLayer/ColorRect/HBoxContainer/VBoxContainer/HBoxContainer/TextureRect.set_texture(Missed)
		$CanvasLayer/ColorRect/HBoxContainer/Label.set_text("Achivement Unlocked: You Missed")
		$CanvasLayer/ColorRect/HBoxContainer/Label2.set_text("You wouldn't hit the apple on the head, you'd likely hit the potato off in the distance that was just sitting there for no reason.")
	if achievement == "Firepower":
		$CanvasLayer/ColorRect/HBoxContainer/VBoxContainer/HBoxContainer/TextureRect.set_texture(Firepower)
		$CanvasLayer/ColorRect/HBoxContainer/Label.set_text("Achivement Unlocked: Firepower")
		$CanvasLayer/ColorRect/HBoxContainer/Label2.set_text("This is some real firepower, wonder who made it? But for now, let the real puzzles begin.")
	$AnimationPlayer.play("Opening")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Opening":
		$AnimationPlayer.play("Closing")
