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
			$Position2D/Label.text = "Artificial Itelligence Devlopment Log #7. We have managed to put the AI in devlopment into a Robot body, It has very similar capablities aside from jump height, and material strength, that thing can't be injured, well, if it could understand that. It can just do basic test chambers as of now, picking up boxes and putting them on buttons to open doors. Quite simple."	


func _on_AnimationPlayer_animation_finished(anim_name):
	anim_play = false
	

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		reading = true


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		reading = false
