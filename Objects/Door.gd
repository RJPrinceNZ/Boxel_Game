extends StaticBody2D

var open = false

	
func _ready():
	$AnimationPlayer.play("Closed")


func _process(delta):
	if open == false:
		$AnimationPlayer.play("Closing")
	else:
		$AnimationPlayer.play("Opening")


