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
		if PlayerStats.current_level == 0:
			$Position2D/Label.text = "Fe-Zn-Al"
		if PlayerStats.current_level == 1:
			$Position2D/Label.text = "You see this button? this resets the room you are in back to whenever you entered it, the process may be mysterious but don't worry, it doesn't hurt. - RJ"
		if PlayerStats.current_level == 3:
			$Position2D/Label.text = "This is the first log of Artificial Itelligence Devlopment. Basic Starts, nothing big so far, can do basic problems, I wonder if I can take this into a bigger puzzle?"
		


func _on_AnimationPlayer_animation_finished(anim_name):
	anim_play = false
	

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		reading = true


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		reading = false
