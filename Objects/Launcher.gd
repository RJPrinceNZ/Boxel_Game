extends Node2D

var current_anim = "Idle"
var x_value = 1
func _ready():
	current_anim = "Idle"
	$AnimationPlayer.play("Idle")
	if $Launcher_Sprite.flip_h == false:
		x_value = 1
	if $Launcher_Sprite.flip_h == true:
		x_value = -1

func _on_Area2D_body_entered(body):
	if body.is_in_group("Box") or body.is_in_group("Player"):
		if current_anim == "Idle":
			current_anim = "Launch"
			$AnimationPlayer.play("Launch")
			SoundPlayer.play_sound_effect("Fling",true)
			if body.is_in_group("Box"):
				body.apply_central_impulse(Vector2(x_value*0.5,-1) * 1200)
			if body.is_in_group("Player"):
				body.velocity = Vector2(x_value*700,-700)
				PlayerStats.is_launched = true
				body.get_node("LaunchTimer").start()
			


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Launch":
		current_anim = "Idle"
		$AnimationPlayer.play("Idle")
