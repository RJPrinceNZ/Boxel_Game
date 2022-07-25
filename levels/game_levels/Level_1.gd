extends Control

func _ready():
	ShadowAnimation.new_animation = "Opening"
	ShadowAnimation.change_animation()
	PlayerStats.current_level = 1
	PlayerStats.has_gun = false
	GameMenu.active = true
	#if not SoundPlayer.current_track == "Forward":
		#SoundPlayer.change_music("Forward")
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
	
	var x = get_viewport().get_size().x
	var y = get_viewport().get_size().y
	var a = ((x/1280)+(y/720))/2
	#$CenterContainer/Node2D.scale = Vector2(a,a)
