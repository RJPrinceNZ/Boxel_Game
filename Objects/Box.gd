extends KinematicBody2D

var velocity = Vector2.ZERO
export (int) var gravity = 800
export (float) var friction = 10
var v = 0
var hit_angle = 0
var change_velocity = false

func _physics_process(delta):
	print(velocity)
	if is_on_floor():
		velocity.x = move_toward(velocity.x, 0, friction)

	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Area2D_body_entered(body):
	if body.is_in_group("Wave"):
		hit_angle = body.rotation_degrees
		v = body.velocity
		change_velocity = true


	

