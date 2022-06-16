extends Node

onready var music = AudioStreamPlayer.new()

var music_tracks = {
	
	
	
	
}


var sound_effects = {
	"Gun_fire":"res://Sound/laserShoot.wav",
	"Explosion":"res://Sound/explosion.wav",
	"Jump":"res://Sound/jump.wav",
	"Fling":"res://Sound/Flinged.wav",
	"Door_Open":"res://Sound/dooropen.wav",
	"Door_Close":"res://Sound/doorclose.wav",
	"Button_Press":"res://Sound/buttonclick.wav",
	"Button_Unpress":"res://Sound/buttonclick2.wav"
	
	

}



var sound_db = 1
var music_db = 1

func change_music_db(val):
	music_db = linear2db(val)

func change_sound_db(val):
	sound_db = linear2db(val)


func _ready():
	pass
	#sound.music = load(sound_effects["Gun_fire"])
	#add_child(music)
	#music.play
	#print("Playing music")

func play_sound_effect(sfx):
	var sound = AudioStreamPlayer.new()
	sound.stream = load(sound_effects[sfx])
	add_child(sound)
	sound.play()
	yield(sound,"finished")
	sound.queue_free()

