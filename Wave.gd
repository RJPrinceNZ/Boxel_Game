extends Sprite

var v = 200
var is_fired = true
var angle
var disappearing = false

var velocity = Vector2.ZERO

func _ready():
	angle = get_global_rotation_degrees()
	$Life_time.start()

	
func _physics_process(delta):
	position += transform.x * v * delta


func _on_Life_time_timeout():
	var disappearing = true
	$Death.start()

func _on_Death_timeout():
	queue_free()


func _on_Area2D_body_entered(body):
	if not body.is_in_group("Player") and not body.is_in_group("Wave"):
		queue_free()


