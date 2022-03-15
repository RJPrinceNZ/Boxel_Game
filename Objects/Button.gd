extends StaticBody2D

var num_object = 0
onready var door = get_parent().get_node("Door")
#onready var animation_player = get_parent().get_node("AnimationPlayer")
onready var state_machine = get_parent().get_node("AnimationTree").get("parameters/playback")
onready var btn_animation_player = get_parent().get_node("ButtonAnimationPlayer")
onready var lgt_animation_player = get_parent().get_node("LightAnimationPlayer")

func _ready():
	
	btn_animation_player.play("Button_Off")

func _on_Area2D_body_entered(body):
	if body.is_in_group("Box") or body.is_in_group("Player"):
		num_object += 1
		if num_object >= 1:
			btn_animation_player.play("Button_Pushed")
			lgt_animation_player.play("On")
			state_machine.travel("Open")
	


func _on_Area2D_body_exited(body):
	if body.is_in_group("Box") or body.is_in_group("Player"):
		num_object -= 1
		
		if num_object <= 0:
			btn_animation_player.play("Button_Off")
			lgt_animation_player.play("Off")
			state_machine.travel("Closed")
	
