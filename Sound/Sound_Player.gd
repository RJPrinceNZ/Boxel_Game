extends Node

onready var music = AudioStreamPlayer.new()
var current_track = "2"
var new_track = "1"

var music_tracks_menus = {
	#Menu Tracks
	"1":"res://Music/forward.wav",
	"2":"res://Music/basic.wav"
	
	}
	#Level Tracks
var music_tracks_levels = {
	
	"3":"res://Music/fireworks.wav",
	"4":"res://Music/campfire.wav"

}



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


func _ready():
	add_child(music)

var sound_db = 1
var music_db = 1

func change_music_db(val):
	music_db = linear2db(val)

func change_sound_db(val):
	sound_db = linear2db(val)

func change_music(track):
	current_track = track
	music.stream = load(music_tracks_menus[track])
	music.play()
	print("Playing music")

func start():
	current_track = "Basic"
	music.stream = load(music_tracks_menus["2"])
	add_child(music)
	music.play()
	print("Playing music")
	change_music(current_track)
	
func play_music():
	
	if PlayerStats.in_level == false:
		randomize()
		new_track = "2"
		print(new_track)
		print(current_track)
		if not new_track == current_track:
			current_track = new_track
			music.stream = load(music_tracks_menus[new_track])
			music.play()
		if new_track == current_track:
			retry()
			
			

	if PlayerStats.in_level == true:
		randomize()
		new_track = str(randi()%2+3)
		if not new_track == current_track:
			current_track = new_track
			music.stream = load(music_tracks_levels[new_track])
			music.play()
		if new_track == current_track:
			retry()

func play_sound_effect(sfx,pitch_option):
	var sound = AudioStreamPlayer.new()
	sound.stream = load(sound_effects[sfx])
	add_child(sound)
	randomize()
	if pitch_option == true:
		var pitch_change = rand_range(0.8,1.2)
		sound.pitch_scale = pitch_change
	sound.play()
	yield(sound,"finished")
	sound.queue_free()


func _process(delta):
	yield(music,"finished")
	play_music()

func retry():
	if new_track == current_track:
		if PlayerStats.in_level == false:
			while new_track == current_track:
				new_track = str(randi()%2+1)
				print(new_track)
			if not new_track == current_track:
				current_track = new_track
				music.stream = load(music_tracks_menus[new_track])
				music.play()
		if PlayerStats.in_level == true:
			while new_track == current_track:
				new_track = str(randi()%2+3)
			if not new_track == current_track:
				current_track = new_track
				music.stream = load(music_tracks_levels[new_track])
				music.play()
	
		
#lists, while no recurive functions.
