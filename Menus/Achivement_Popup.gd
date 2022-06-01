extends Control

var Escaped = preload("res://sprites/Icon_Achivement_Escape.png")
var Potato = preload("res://sprites/Icon_Achivement_Potato.png")
var Missed = preload("res://sprites/Icon_Achivement_You_Missed.png")
var Firepower = preload("res://sprites/Icon_Achivement_Firepower.png")

func _ready():
	$AnimationPlayer.play("Closed")

func achievement_get(achievement):
	if achievement == "Escaped":
		$CenterContainer/HBoxContainer/AchivementPopUp/Position2D/TextureRect.set_texture(Escaped)
		$CenterContainer/HBoxContainer/AchivementPopUp/Position2D/Label.set_text("Achivement Unlocked: Escaped")
		$CenterContainer/HBoxContainer/AchivementPopUp/Position2D/Position2D/Label2.set_text("You escaped the facility, but what is your next step?")
	if achievement == "Potato":
		$CenterContainer/HBoxContainer/AchivementPopUp/Position2D/TextureRect.set_texture(Potato)
		$CenterContainer/HBoxContainer/AchivementPopUp/Position2D/Label.set_text("Achivement Unlocked: Potato")
		$CenterContainer/HBoxContainer/AchivementPopUp/Position2D/Position2D/Label2.set_text("The potato! The classic food, but also a joke from where I'm from, eheh, it's funny. - RJ")
	if achievement == "Missed":
		$CenterContainer/HBoxContainer/AchivementPopUp/Position2D/TextureRect.set_texture(Missed)
		$CenterContainer/HBoxContainer/AchivementPopUp/Position2D/Label.set_text("Achivement Unlocked: You Missed")
		$CenterContainer/HBoxContainer/AchivementPopUp/Position2D/Position2D/Label2.set_text("You wouldn't hit the apple on the head, you'd likely hit the potato off in the distance that was just sitting there for no reason.")
	if achievement == "Firepower":
		$CenterContainer/HBoxContainer/AchivementPopUp/Position2D/TextureRect.set_texture(Firepower)
		$CenterContainer/HBoxContainer/AchivementPopUp/Position2D/Label.set_text("Achivement Unlocked: Firepower")
		$CenterContainer/HBoxContainer/AchivementPopUp/Position2D/Position2D/Label2.set_text("This is some real firepower, wonder who made it? But for now, let the real puzzles begin.")
	$AnimationPlayer.play("Opening")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Opening":
		$AnimationPlayer.play("Closing")
