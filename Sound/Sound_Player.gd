extends Node

onready var music = AudioStreamPlayer.new()
var current_track = str(randi()%2+1)
var new_track = str(randi()%2+1)
var can_play_music = false

var tracks_1 = [1,2]
var tracks_2 = [3,4]

var selection       

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
	process_priority = -100
	add_child(music)
	randomize()

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
		if tracks_1.size() == 0:
			tracks_1 = [1,2]
			if selection == 1 or selection == 2:
				tracks_1.erase(selection)
		randomize()
		selection = tracks_1[randi()% tracks_1.size()]
		tracks_1.erase(selection)
		print(selection)
		new_track = str(selection)
		current_track = new_track
		add_child(music)
		music.stream = load(music_tracks_menus[new_track])
		music.play()
		yield(music,"finished")
		music.queue_free()
			

	if PlayerStats.in_level == true:
		if tracks_2.size() == 0:
			tracks_2 = [3,4]
			tracks_2.erase(selection)
			if selection == 3 or selection == 4:
				tracks_2.erase(selection)
		randomize()
		selection = tracks_2[randi()% tracks_2.size()]
		tracks_2.erase(selection)
		print(selection)
		new_track = str(selection)
		current_track = new_track
		add_child(music)
		music.stream = load(music_tracks_levels[new_track])
		music.play()
		

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
	pass
	#if ResourceLoader.exists(music):
		#if music.is_playing() == false and can_play_music == true:
		#	music.queue_free()
		#	play_music()
	

	
func rand_num(from,to):
	return from + randi() % (to - from)
	
#lists, while no recurive functions.
