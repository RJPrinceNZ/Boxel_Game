extends Sprite

onready var bullet = preload("res://player/Wave.tscn")
var on_cool_down = false
onready var root_node = get_tree().root.get_child(0)
onready var player = get_node("../Player")
var can_fire = true


func _physics_process(delta):
	if PlayerStats.has_gun == true:
		$ShockwaveGun.set_visible(true)
		if PlayerStats.number_held > 0:
			can_fire = false
		elif PlayerStats.number_held <= 0:
			can_fire = true
	elif PlayerStats.has_gun == false:
		$ShockwaveGun.set_visible(false)
		can_fire = false

	
	var mouse = get_global_mouse_position()
	var angle = get_angle_to(mouse)
	$ShockwaveGun.set_rotation(angle)
	if angle > -1.5 and angle < 1.5:
		$ShockwaveGun.flip_v = false
	else:
		$ShockwaveGun.flip_v = true
	if Input.is_action_just_pressed("fire") and ShadowAnimation.finished_anim == true and on_cool_down == false and can_fire == true and PlayerStats.ui_block == false and PlayerStats.game_menus_open < 1:
		on_cool_down = true
		$AnimationPlayer.play("FIRE")
		var new_bullet = bullet.instance()
		new_bullet.global_transform = $ShockwaveGun/Position2D.global_transform
		root_node.add_child(new_bullet)
		SoundPlayer.play_sound_effect("Gun_fire",true)
		$Gun_Timer.start()
	if on_cool_down == false:
		$AnimationPlayer.play("IDLE")

func _on_Gun_Timer_timeout():
	on_cool_down = false
	$AnimationPlayer.play("IDLE")
