extends Sprite

func _physics_process(delta):
	var mouse = get_global_mouse_position()
	print(mouse)
	var angle = get_angle_to(mouse)
	print(angle)
	rotate(angle)
