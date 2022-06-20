extends Node2D

func _ready():
	$AnimationPlayer.play("Explosion")
	SoundPlayer.play_sound_effect("Explosion",true)



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Explosion":
		queue_free()
