extends Node2D

func _ready():
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()
	PlayerStats.current_level = 10
	PlayerStats.has_gun = true
	GameMenu.active = true
