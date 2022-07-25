extends Control

func _ready():
	pass # Replace with function body.

func _process(delta):
	var x = get_viewport().get_size().x
	var y = get_viewport().get_size().y
	var a = ((x/1280)+(y/720))/2
	$CenterContainer.rect_scale = Vector2(a,a)
	$CenterContainer/Camera2D.zoom = Vector2(1/a,1/a)
