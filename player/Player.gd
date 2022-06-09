extends KinematicBody2D
export (int) var speed = 300
export (int) var jump_speed = -480
export (int) var gravity = 800
export (float) var friction = 10
export (float) var acceration = 25
export (int, 0, 200) var push = 100

var velocity = Vector2.ZERO
var anim_play = true
var can_walk_r = true
var can_walk_l = true

enum state {IDLE, WALKING, STARTJUMP, JUMP_MID, FALL, JUMP, JUMPFINISH}

onready var player_state = state.IDLE
onready var box = "res://Objects/Box.tscn"

func _ready():
	$AnimationPlayer.play("Idle")


func update_animation(anim):
	if velocity.x > 0:
		$Sprite.flip_h = false
		
	if velocity.x < 0:
		$Sprite.flip_h = true
	
	if PlayerStats.has_gun == false:
		match(anim):
			state.FALL:
				$AnimationPlayer.play("FALL")
			state.IDLE:
				$AnimationPlayer.play("IDLE")
			state.WALKING:
				$AnimationPlayer.play("WALK")
			state.JUMP:
				$AnimationPlayer.play("JUMP")
	elif PlayerStats.has_gun == true:
		match(anim):
			state.FALL:
				$AnimationPlayer.play("FALL_ARMLESS")
			state.IDLE:
				$AnimationPlayer.play("IDLE_ARMLESS")
			state.WALKING:
				$AnimationPlayer.play("WALK_ARMLESS")
			state.JUMP:
				$AnimationPlayer.play("JUMP_ARMLESS")
	
func handle_state(player_state):
	match(player_state):
		state.STARTJUMP:
			velocity.y = jump_speed

func get_input():
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left")
	if !PlayerStats.is_launched:
		if can_walk_r == false and PlayerStats.number_held > 0:
			dir = - Input.get_action_strength("left")
		elif can_walk_l == false and PlayerStats.number_held > 0:
			dir = Input.get_action_strength("right")

		if dir != 0:
			velocity.x = move_toward(velocity.x, dir*speed, acceration)
		else:
			velocity.x = move_toward(velocity.x, 0, friction)



func _physics_process(delta):
	if is_on_wall() == true or is_on_floor() == true and $LaunchTimer.is_stopped():
		PlayerStats.is_launched = false
	
	if $shockwave.on_cool_down == true:
		$Recharge_point/AnimationPlayer2.play("Recharge")
	if $shockwave.on_cool_down == false:
		$Recharge_point/AnimationPlayer2.play("Idle")
	
	get_input()
	if velocity == Vector2.ZERO:
		player_state = state.IDLE
	if Input.is_action_just_pressed("up") and is_on_floor():
		player_state = state.STARTJUMP
	elif velocity.x != 0:
		player_state = state.WALKING


	if not is_on_floor():
		if velocity.y < 0:
			player_state = state.JUMP
		if velocity.y > 0:
			player_state = state.FALL
	
	handle_state(player_state)
	update_animation(player_state)
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, PI/4, false)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("Bodies"):
			collision.collider.apply_central_impulse(-collision.normal * push)
	
	



func _on_Area2D2_body_entered(body):
	print(body.name)
	if body.is_in_group("object_wall"):
		PlayerStats.can_pick = false
		can_walk_r = false
		


func _on_Area2D2_body_exited(body):
	if body.is_in_group("object_wall"):
		PlayerStats.can_pick = true
		can_walk_r = true


func _on_Area2D3_body_entered(body):
	if body.is_in_group("object_wall"):
		PlayerStats.can_pick = false
		can_walk_l = false


func _on_Area2D3_body_exited(body):
	if body.is_in_group("object_wall"):
		PlayerStats.can_pick = true
		can_walk_l = true
