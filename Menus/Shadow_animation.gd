extends Control

var current_animation = "Closed"
var new_animation = "Closed"
var can_change_animation = true
var finished_anim = false


func change_animation():
	if not current_animation == new_animation:
		can_change_animation = false
		finished_anim = false
		current_animation = new_animation
		if current_animation == "Closed":
			$AnimationPlayer.play("Closed")
		if current_animation == "Opening":
			$AnimationPlayer.play("Opening")
		if current_animation == "Open":
			$AnimationPlayer.play("Open")
		if current_animation == "Closing":
			$AnimationPlayer.play("Closing")
		if current_animation == "Title_Opening":
			$AnimationPlayer.play("Title_Opening")

func _on_AnimationPlayer_animation_finished(anim_name):
	can_change_animation = true
	finished_anim = true
	if anim_name == "Title_Opening":
		new_animation = "Opening"
		change_animation()
	if anim_name == "Opening":
		new_animation = "Open"
		change_animation()
