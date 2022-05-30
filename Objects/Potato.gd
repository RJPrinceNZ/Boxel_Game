extends Node2D



func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		if PlayerStats.potato == false:
			PlayerStats.potato = true
			AchivementPopup.achievement_get("Potato")
