extends RigidBody2D

var velocity = Vector2.ZERO
#export (int) var gravity = 800
#export (float) var friction = 10
var v = 0
var hit_angle = 0
var change_velocity = false
var hit_recent = false
var picked = false
onready var point = get_node("../Player/shockwave/ShockwaveGun/Hover_point")
onready var lowest_point = get_node("../Player/Lowest_point")
onready var player = get_node("../Player")

func _physics_process(delta):
	print(PlayerStats.number_held)
	if picked == true:
		linear_velocity=Vector2.ZERO
		angular_velocity=0
		if point.global_position.y > lowest_point.global_position.y:
			self.position = Vector2(point.global_position.x,lowest_point.global_position.y)
		else:
			self.position = point.global_position

func _input(event):
	if Input.is_action_just_pressed("pick_up"):
		var bodies = $Detect.get_overlapping_bodies()
		for body in bodies:
			print(body)
			print("pick_up?")
			if body.is_in_group("Player") and PlayerStats.number_held <1:
				$CollisionShape2D.set_disabled(true)
				PlayerStats.number_held +=1
				picked = true
			else:
				print("no")
	if Input.is_action_just_released("pick_up") and picked == true:
		$CollisionShape2D.set_disabled(false)
		PlayerStats.number_held += -1
		linear_velocity=Vector2(0,1)
		angular_velocity=0
		picked = false


func _on_Area2D_area_entered(area):
	if area.is_in_group("Explosion"):
		var hit_direction = (global_position - area.global_position).normalized()
		if hit_recent == false:
			hit_recent = true
			$Collision_timer.start()
			apply_central_impulse(hit_direction * 750)
		


func _on_Collision_timer_timeout():
	hit_recent = false
