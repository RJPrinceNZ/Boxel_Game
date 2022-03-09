extends RigidBody2D

var velocity = Vector2.ZERO
#export (int) var gravity = 800
#export (float) var friction = 10
var v = 0
var hit_angle = 0
var change_velocity = false

func _physics_process(delta):
	pass
#	if is_on_floor():
#		velocity.x = move_toward(velocity.x, 0, friction)

#	velocity.y += gravity * delta
#	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Area2D_body_entered(body):
	pass
#	if body.is_in_group("Wave"):
#		hit_angle = body.rotation_degrees
#		v = body.velocity
#		change_velocity = true


	
func _on_Area2D_area_entered(area):
	if area.is_in_group("Explosion"):
		var hit_direction = (global_position - area.global_position).normalized()
		print(hit_direction)
		apply_central_impulse(hit_direction * 500)
		
