extends RigidBody2D

var velocity = Vector2.ZERO
#export (int) var gravity = 800
#export (float) var friction = 10
var v = 0
var hit_angle = 0
var change_velocity = false
var hit_recent = false
var picked = false

func _physics_process(delta):
	if picked == true:
		self.position = get_node("../Player/Shockwave/Position2D").global_position

func input(event):
	if Input.is_action_just_pressed("pick_up"):
		var Areas = $Area2D.get_overlapping_areas()
		for Area in Areas:
			if Area.is_in_group("Player") and get_node("../Player").can_pick == true:
				picked = true
				get_node("../Player").can_pick = false
	if Input.is_action_just_released("pick_up") and picked == true:
		picked = false
		get_node("../Player").can_pick = true


func _on_Area2D_area_entered(area):
	if area.is_in_group("Explosion"):
		var hit_direction = (global_position - area.global_position).normalized()
		if hit_recent == false:
			hit_recent = true
			$Collision_timer.start()
			apply_central_impulse(hit_direction * 750)
		


func _on_Collision_timer_timeout():
	hit_recent = false
