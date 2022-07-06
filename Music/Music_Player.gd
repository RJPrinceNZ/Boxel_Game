extends AudioStreamPlayer

var current_track = str(randi()%2+1)
var new_track = str(randi()%2+1)

var selection       
signal track_finished

var music_tracks_menus = {
	#Menu Tracks
	"1":"res://Music/forward.wav",
	"2":"res://Music/basic.wav",
	"3":"res://Music/space.wav"
	
	}
	#Level Tracks
var music_tracks_levels = {
	"3":"res://Music/space.wav",
	"4":"res://Music/fireworks.wav",
	"5":"res://Music/campfire.wav",
	"6":"res://Music/Digital_Workplace.wav"

}


func _ready():
	print(linear2db(1))
	randomize()
	self.connect("track_finished",self,"play_music")
	change_music_db(2)
	

var music_db = 1

func change_music_db(val):
	music_db = linear2db(val)
	set_volume_db(music_db)
	pass



func change_music(track):
	current_track = track
	set_stream(load(music_tracks_menus[track]))
	play()
	print("Playing music")

func start():
	current_track = "Basic"
	set_stream(load(music_tracks_menus["2"]))
	play()
	print("Playing music")
	change_music(current_track)
		

func play_music():
	print("play music")
	if PlayerStats.in_level == false:
		new_track = str(randi()%3+1)
		if not new_track == current_track:
			current_track = new_track
			set_stream(load(music_tracks_menus[current_track]))
			play()
			yield(self,"finished")
			emit_signal("track_finished")
			print("track finished signal")
		else:
			emit_signal("track_finished")
			print("number_invalid")
			
		
	if PlayerStats.in_level == true:
		new_track = str(randi()%4+3)
		if not new_track == current_track:
			current_track = new_track
			set_stream(load(music_tracks_levels[current_track]))
			play()
			yield (self,"finished")
			emit_signal("track_finished")
			print("track finished signal")
		else:
			emit_signal("track_finished")
			print("number_invalid")
			
#func play_music():
#	if PlayerStats.in_level == false:
#		if tracks_1.size() == 0:
#			tracks_1 = [1,2]
#			if selection == 1 or selection == 2:
#				tracks_1.erase(selection)
#		randomize()
#		var new_music = music.instance()
#		add_child(new_music)
#		selection = tracks_1[randi()% tracks_1.size()]
#		tracks_1.erase(selection)
#		print(selection)
#		new_track = str(selection)
#		current_track = new_track
#
#		music.stream = load(music_tracks_menus[new_track])
#		music.play()
#		yield(new_music,"finished")
#		music.queue_free()
#
#
#
#	if PlayerStats.in_level == true:
#		if tracks_2.size() == 0:
#			tracks_2 = [3,4]
#			tracks_2.erase(selection)
#			if selection == 3 or selection == 4:
#				tracks_2.erase(selection)
#		randomize()
#		var new_music = music.instance()
#		add_child(new_music)
#		selection = tracks_2[randi()% tracks_2.size()]
#		tracks_2.erase(selection)
#		print(selection)
#		new_track = str(selection)
#		current_track = new_track
#		music.stream = load(music_tracks_levels[new_track])
#		music.play()
#		yield(new_music,"finished")
#		new_music.queue_free()

	

#func _process(delta):
#	if is_instance_valid(music):
#		#print("not existing")
#		pass
#
#	else:
#		#print("not_existing")
#		play_music()
