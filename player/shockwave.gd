extends Sprite

onready var bullet = preload("res://player/Wave.tscn")
var on_cool_down = false
onready var root_node = get_tree().root.get_child(0)

func _ready():
	if PlayerStats.has_gun == false:
		queue_free()

func _physics_process(delta):
	var mouse = get_global_mouse_position()
	var angle = get_angle_to(mouse)
	$ShockwaveGun.set_rotation(angle)
	if angle > -1.5 and angle < 1.5:
		$ShockwaveGun.flip_v = false
	else:
		$ShockwaveGun.flip_v = true
	if Input.is_action_just_pressed("fire") and on_cool_down == false:
		on_cool_down = true
		$AnimationPlayer.play("FIRE")
		var new_bullet = bullet.instance()
		new_bullet.global_transform = $ShockwaveGun/Position2D.global_transform
		root_node.add_child(new_bullet)
		$Gun_Timer.start()
	if on_cool_down == false:
		$AnimationPlayer.play("IDLE")

		

func _on_Gun_Timer_timeout():
	on_cool_down = false
	$AnimationPlayer.play("IDLE")
