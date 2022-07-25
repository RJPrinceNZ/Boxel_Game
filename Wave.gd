extends Node2D

onready var root_node = get_tree().root.get_child(0)
onready var explosion = preload("res://player/Explosion.tscn")
var a = 0
var v = 200*a
var is_fired = true
var angle
var disappearing = false

var velocity = Vector2.ZERO

func _ready():
	angle = get_global_rotation_degrees()
	$Life_time.start()

	
func _physics_process(delta):
	position += transform.x * v * delta
	var x = get_viewport().get_size().x
	var y = get_viewport().get_size().y
	a = ((x/1280)+(y/720))/2

func _on_Life_time_timeout():
	var disappearing = true
	$Death.start()

func _on_Death_timeout():
	queue_free()


func _on_Area2D_body_entered(body):
	if not body.is_in_group("Player") and not body.is_in_group("Wave"):
		var new_explosion = explosion.instance()
		new_explosion.global_transform = $Position2D.global_transform
		root_node.add_child(new_explosion)
		queue_free()


