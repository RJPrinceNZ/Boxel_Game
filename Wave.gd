extends KinematicBody2D

onready var root_node = get_tree().root.get_child(0)
onready var explosion = preload("res://player/Explosion.tscn")
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
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("Box"):
			collision.collider.apply_central_impluse(-collision.normal)
		

func _on_Life_time_timeout():
	var disappearing = true
	$Death.start()

func _on_Death_timeout():
	queue_free()


func _on_Area2D_body_entered(body):
	if not body.is_in_group("Player") and not body.is_in_group("Wave"):
		var new_explosion = explosion.instance()
		new_explosion.global_transform = $Position2D.global_transform
		root_node.add_child(explosion)
		queue_free()


