extends Node2D

var current_anim = "idle"
var can_play = true

func _ready():
	PlayerStats.has_gun = false

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		PlayerStats.has_gun = true
		if PlayerStats.firepower == false:
			PlayerStats.firepower = true
			AchivementPopup.achievement_get("Firepower")
		

func _process(delta):
	if PlayerStats.has_gun == false:
		if not current_anim == "idle" or can_play == true:
			can_play = false
			current_anim = "idle"
			$AnimationPlayer.play("Idle")
	if PlayerStats.has_gun == true:
		if not current_anim == "taken" or can_play == true:
			can_play = false
			current_anim = "taken"
			$AnimationPlayer.play("Taken")


func _on_AnimationPlayer_animation_finished(anim_name):
	can_play = true
