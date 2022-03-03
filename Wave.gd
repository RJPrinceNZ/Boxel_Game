extends Sprite

var v = 250
var is_fired = true
var angle
var disappearing = false

var velocity = Vector2.ZERO

func _ready():
	angle = get_global_rotation_degrees()
	$Life_time.start()

	
func _physics_process(delta):
	position += transform.x * v * delta
	if disappearing == true:
		$Death.start()


func _on_Life_time_timeout():
	var disappearing = true


func _on_Death_timeout():
	queue_free()
