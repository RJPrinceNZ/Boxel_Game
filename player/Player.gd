extends KinematicBody2D
var animation_timer_fin = true
export (int) var speed = 120
export (int) var jump_speed = 180
export (int) var gravity = 400

var velocity = Vector2.ZERO

enum state {IDLE, WALKING, JUMP}

onready var player_state = state.IDLE

func _ready():
	$AnimationPlayer.play("Idle")

func _on_Animation_timer_timeout():
	animation_timer_fin = true

func update_animation(anim):
	$AnimationPlayer.play(anim)
	
func handle_state(state):
	pass

func get_input():
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left")
	if dir != 0:
		velocity.x = move_toward(velocity.x, dir/speed, speed)
	else:
		velocity.x = move_toward(velocity.x, 0, 0)
func _physics_process(delta):
	get_input()
	if velocity.x == 0:
		player_state = state.IDLE

