extends Node2D

	
func _on_Do_no_quit_pressed():
	print("do not quit")
	queue_free()

func _on_quit_pressed():
	print("quit")
	
