extends Node2D

var reading = false
var anim_play = false

func _process(delta):
	if reading == false:
		if anim_play == false:
			anim_play = true
			$AnimationPlayer.play("Idle")
	if reading == true:
		if anim_play == false:
			anim_play = true
			$AnimationPlayer.play("Selected")



func _on_AnimationPlayer_animation_finished(anim_name):
	anim_play = false
