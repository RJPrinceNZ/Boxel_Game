extends Node2D

func _ready():
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()
	PlayerStats.current_level = 5
	PlayerStats.has_gun = false
	GameMenu.active = true
