extends StaticBody2D

var is_pressed = false
onready var door = get_parent().get_node("Door")


func _process(delta):
	if is_pressed == false:
		$AnimationPlayer.play("OFF")
		door.open = false
	if is_pressed == true:
		$AnimationPlayer.play("PRESSED")
		door.open = true




func _on_Area2D_body_entered(body):
	if body.is_in_group("Box") or body.is_in_group("Player"):
		is_pressed = true
		


func _on_Area2D_body_exited(body):
	if body.is_in_group("Box") or body.is_in_group("Player"):
		is_pressed = false
		
