extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _process(delta):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Opening")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
