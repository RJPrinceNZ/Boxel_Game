extends Node2D

var reading = false
var anim_play = false
var current_anim = "idle"

func _process(delta):
	if reading == false:
		if anim_play == false or not current_anim == "idle":
			current_anim = "idle"
			anim_play = true
			$AnimationPlayer.play("Idle")
		$Position2D.scale = Vector2(0,0)
	if reading == true:
		if anim_play == false or not current_anim == "selected":
			current_anim = "selected"
			anim_play = true
			$AnimationPlayer.play("Selected")
		$Position2D.scale = Vector2(1,1)
		if PlayerStats.current_level == 1:
			$Position2D/Label.text = "< Fe-Zn-Al"
		if PlayerStats.current_level == 2:
			$Position2D/Label.text = "You see the button down in the corner? this resets the room you are in back to whenever you entered it, the process may be mysterious but don't worry, it doesn't hurt. - RJ"
		if PlayerStats.current_level == 3:
			$Position2D/Label.text = "Artificial Intelligence Devlopment Log #7. We have managed to put the AI in devlopment into a Robot body, It has very similar capablities aside from jump height, and material strength, that thing can't be injured, well, if it could understand that as I had to downgrade it's capablitiies. It can just do basic test chambers as of now, picking up boxes and putting them on buttons to open doors. Quite simple. -RJ"	
		if PlayerStats.current_level == 4:
			$Position2D/Label.text = "Artifical Intelligence Devlopment Log #3, We have made progress, the AI has capablities of solving basic puzzles, Where does the square go? , What is greater, 5 or 1?, etc. I'll try to make it more intellengent for now, while I have a greater puzzle to figure out. - RJ"
		if PlayerStats.current_level == 5:
			$Position2D/Label.text = "Presenting, the Long Range Shockwave Projectile Launcher Gun, also know as the Shockwave gun. This thing when shot launches anything... except the user. Useful for getting things down from high places. It can also hold objects out front of it, there were some problems in testing with people firing the gun while holding objects, so we had to disable firing the gun when holding and object, don't want fast moving chunks of whatever in your face do we? - RJ"
			
func _on_AnimationPlayer_animation_finished(anim_name):
	anim_play = false
	

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		reading = true


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		reading = false
