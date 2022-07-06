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

var vol = 1
var current_vol = linear2db(1)

func set_volume(value):
	vol = value
	current_vol = linear2db(value)
	
func play_sound_effect(sfx,pitch_option):
	var soundfx = AudioStreamPlayer.new()
	soundfx.stream = load(sound_effects[sfx])
	if pitch_option == true:
		randomize()
		var pitch_change = rand_range(0.8,1.2)
		soundfx.pitch_scale = pitch_change
	soundfx.set_volume_db(current_vol)
	add_child(soundfx)
	soundfx.play()
	yield(soundfx,"finished")
	print("end")
	soundfx.queue_free()

