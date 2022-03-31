extends RigidBody2D

var velocity = Vector2.ZERO
#export (int) var gravity = 800
#export (float) var friction = 10
var v = 0
var hit_angle = 0
var change_velocity = false
var hit_recent = false
var picked = false
onready var point = get_node("../Player/shockwave/ShockwaveGun/Position2D")

func _physics_process(delta):
	print(PlayerStats.number_held)
	if picked == true:
		velocity = Vector2.ZERO
		self.position = point.global_position

func _input(event):
	if Input.is_action_just_pressed("pick_up"):
		var bodies = $Detect.get_overlapping_bodies()
		for body in bodies:
			print(body)
			print("pick_up?")
			if body.is_in_group("Player") and PlayerStats.number_held <1:
				PlayerStats.number_held +=1
				print("yes")
				picked = true
			else:
				print("no")
	if Input.is_action_just_released("pick_up") and picked == true:
		PlayerStats.number_held += -1
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
