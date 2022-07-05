extends AudioStreamPlayer

var sound_effects = {
	"Gun_fire":"res://Sound/laserShoot.wav",
	"Explosion":"res://Sound/explosion.wav",
	"Jump":"res://Sound/jump.wav",
	"Fling":"res://Sound/Flinged.wav",
	"Door_Open":"res://Sound/dooropen.wav",
	"Door_Close":"res://Sound/doorclose.wav",
	"Button_Press":"res://Sound/buttonclick.wav",
	"Button_Unpress":"res://Sound/buttonclick2.wav",
	"Walk":"res://Sound/walk.wav",
	"Hover_Button":"res://Sound/hover_button.wav",
	"Unhover_Button":"res://Sound/unhover_button.wav"
	}


var vol = 2
var current_vol = linear2db(2)

func play_sound_effect(sfx,pitch_option):
	print("hello")
	var sound = AudioStreamPlayer.new()
	sound.stream = load(sound_effects[sfx])
	sound.volume_db = current_vol
	randomize()
	if pitch_option == true:
		var pitch_change = rand_range(0.8,1.2)
		sound.pitch_scale = pitch_change
	sound.play()
	yield(sound,"finished")
	sound.queue_free()

func set_volume(volume):
	current_vol = linear2db(volume)
	vol = volume
