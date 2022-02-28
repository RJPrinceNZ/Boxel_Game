extends KinematicBody2D
var animation_timer_fin = true
export (int) var speed = 120
export (int) var jump_speed = -180
export (int) var gravity = 400
export (float) var friction = 10
export (float) var acceration = 25


var velocity = Vector2.ZERO

enum state {IDLE, WALKING, STARTJUMP, JUMP_MID, FALL, JUMP, JUMPFINISH}

onready var player_state = state.IDLE

func _ready():
	$AnimationPlayer.play("Idle")

func _on_Animation_timer_timeout():
	animation_timer_fin = true

func update_animation(anim):
	if velocity.x > 0:
		$Sprite.flip_h = false
	if velocity.x < 0:
		$Sprite.flip_h = true
	match(anim):
		state.FALL:
			$AnimationPlayer.play("FALL")
		state.IDLE:
			$AnimationPlayer.play("IDLE")
		state.WALKING:
			$AnimationPlayer.play("WALK")
		state.JUMP:
			$AnimationPlayer.play("JUMP")
	
func handle_state(player_state):
	match(player_state):
		state.STARTJUMP:
			velocity.y = jump_speed

func get_input():
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left")
	if dir != 0:
		velocity.x = move_toward(velocity.x, dir*speed, acceration)
	else:
		velocity.x = move_toward(velocity.x, 0, friction)
func _physics_process(delta):
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
		if velocity.y == 0:
			player_state = state.JUMP_MID
		if velocity.y > 0:
			player_state = state.FALL
	
	handle_state(player_state)
	update_animation(player_state)
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)

