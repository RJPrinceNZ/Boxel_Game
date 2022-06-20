extends Node2D

func _ready():
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()
	PlayerStats.current_level = 9
	PlayerStats.has_gun = true
	GameMenu.active = true
func _process(delta):
	if PlayerStats.dark_background == true:
		$Background.modulate = Color(0.4,0.4,0.4)
		$SupportPland_decals.modulate = Color(0.4,0.4,0.4)
	if PlayerStats.dark_background == false:
		$Background.modulate = Color(1,1,1)
		$SupportPland_decals.modulate = Color(1,1,1)
