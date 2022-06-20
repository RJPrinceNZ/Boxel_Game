extends StaticBody2D

func _ready():
	pass

func door_open():
	SoundPlayer.play_sound_effect("Door_Open",true)


func door_close():
	SoundPlayer.play_sound_effect("Door_Close",true)
