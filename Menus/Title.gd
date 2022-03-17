extends Node

onready var play = $Play

func _process(delta):
	pass

func _on_Play_pressed():
	print("Play")


func _on_Play_mouse_entered():
	print("Mouse_entered_play")
	play.set_scale(Vector2(1.235,1.235))
	play.set_position(Vector2(428,256.8))

func _on_Play_mouse_exited():
	print("Mouse_exited_play")
	play.set_scale(Vector2(1,1))
	play.set_position(Vector2(444,264))


func _on_Settings_mouse_entered():
	print("Mouse_entered_settings")


func _on_Settings_mouse_exited():
	print("Mouse_exited_settings")
	play.set_scale(Vector2(1,1))
	play.set_position(Vector2(380,350))
