extends Node2D

func _ready():
	$AnimationPlayer.play("Explosion")



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Explosion":
		queue_free()
