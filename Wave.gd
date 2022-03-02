extends Sprite

var v = 100
var is_fired = true

var velocity = Vector2.ZERO

func _ready():
	print("hello")
	var angle
	angle = get_global_rotation_degrees()
	print(get_global_transform())
