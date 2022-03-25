extends Node

func _ready():
	PlayerStats.current_level = PlayerStats.level_count
	PlayerStats.has_gun = true
