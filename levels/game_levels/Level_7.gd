extends Control

func _ready():
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()
	PlayerStats.current_level = 7
	PlayerStats.has_gun = true
	GameMenu.active = true
#	if not SoundPlayer.current_track == "Forward":
#		SoundPlayer.change_music("Forward")
	if PlayerStats.in_level == false:
		PlayerStats.in_level = true
		MusicPlayer.play_music()
func _process(delta):
	if PlayerStats.dark_background == true:
		$Background.modulate = Color(0.4,0.4,0.4)
		$SupportPland_decals.modulate = Color(0.4,0.4,0.4)
	if PlayerStats.dark_background == false:
		$Background.modulate = Color(1,1,1)
		$SupportPland_decals.modulate = Color(1,1,1)
