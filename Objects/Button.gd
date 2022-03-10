extends StaticBody2D

var is_pressed = false

func _process(delta):
	if is_pressed == false:
		$AnimationPlayer.play("OFF")
	if is_pressed == true:
		$AnimationPlayer.play("PRESSED")




func _on_Area2D_body_entered(body):
	if body.is_in_group("Box") or body.is_in_group("Player"):
		is_pressed = true


func _on_Area2D_body_exited(body):
	if body.is_in_group("Box") or body.is_in_group("Player"):
		is_pressed = false
