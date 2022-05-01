extends Node2D

var reading = false
var anim_play = false
var current_anim = "idle"
var current_page = 1
var max_page

func _ready():
	current_page = 1

func _process(delta):
	if reading == false:
		if anim_play == false or not current_anim == "idle":
			current_anim = "idle"
			anim_play = true
			$AnimationPlayer.play("Idle")
		$Position2D.scale = Vector2(0,0)
	if reading == true:
		if anim_play == false or not current_anim == "selected":
			current_anim = "selected"
			anim_play = true
			$AnimationPlayer.play("Selected")
		$Position2D.scale = Vector2(1,1)
		if PlayerStats.current_level == 1:
			max_page = 1
		if PlayerStats.current_level == 2:
			max_page = 4
		if PlayerStats.current_level == 3:
			max_page = 7
		if PlayerStats.current_level == 4:
			max_page = 4
		if PlayerStats.current_level == 5:
			max_page = 7
		if PlayerStats.current_level == 6:
			$Position2D/Label.text = "This is a Object Wall. It prevent inanimate objects from going through it. Humans and robots and any objects on a white list, such as clothes, or any equipment like the Shockwave gun. Anything unauthorized will be blocked from going past, inculding other authorized things if with such an object."
		if current_page == 1:
			$Position2D/Left_arrow.scale = (Vector2(0,0))
		else:
			$Position2D/Left_arrow.scale = (Vector2(0.4,0.4))
		if current_page == max_page:
			$Position2D/Right_arrow.scale = (Vector2(0,0))
		else:
			$Position2D/Right_arrow.scale = (Vector2(0.4,0.4))
		
		if current_page < 1:
			current_page = 1
		if current_page > max_page:
			current_page = max_page
		if PlayerStats.current_level == 1:
			if current_page == 1:
				$Position2D/Label.text = "< Fe-Zn-Al"
		if PlayerStats.current_level == 2:
			if current_page == 1:
				$Position2D/Label.text = "You see the button down in the corner?"
			if current_page == 2:
				$Position2D/Label.text = "This resets the room you are in back to whenever you entered it."
			if current_page == 3:
				$Position2D/Label.text = "the process may be mysterious but don't worry,"
			if current_page == 4:
				$Position2D/Label.text = "it doesn't hurt. - RJ"
		if PlayerStats.current_level == 3:
			if current_page == 1:
				$Position2D/Label.text = "Artificial Intelligence Devlopment Log #7"
			if current_page == 2:
				$Position2D/Label.text = "We have managed to put the AI in devlopment into a Robot body."
			if current_page == 3:
				$Position2D/Label.text = "It has very similar capablities to humans,"
			if current_page == 4:
				$Position2D/Label.text = "aside from jump height, and material strength, that thing can't be injured,"
			if current_page == 5:
				$Position2D/Label.text = "well, if it could understand that, I had to downgrade it's capablitiies."
			if current_page == 6:
				$Position2D/Label.text = "It can just do basic test chambers as of now,"
			if current_page == 7:
				$Position2D/Label.text = "picking up boxes and putting them on buttons to open doors. Quite simple. -RJ"
		if PlayerStats.current_level == 4:
			if current_page == 1:
				$Position2D/Label.text = "Artifical Intelligence Devlopment Log #3"
			if current_page == 2:
				$Position2D/Label.text = "We have made progress, the AI has capablities of solving basic puzzles,"
			if current_page == 3:
				$Position2D/Label.text = "Where does the square go? , What is greater, 5 or 1?, etc."
			if current_page == 4:
				$Position2D/Label.text = "I'll try to make it more intellengent for now, while I have a greater puzzle to figure out. - RJ"
		if PlayerStats.current_level == 5:
			if current_page == 1:
				$Position2D/Label.text = "Presenting, the Long Range Shockwave Projectile Launching Device!"
			if current_page == 2:
				$Position2D/Label.text = "also know as the Shockwave Gun."
			if current_page == 3:
				$Position2D/Label.text = "When this thing is shot launches anything... except the user"
			if current_page == 4:
				$Position2D/Label.text = "Nothing is harmed when hit. Useful for getting things down from high places."
			if current_page == 5:
				$Position2D/Label.text = "It can also hold objects out front of it, there were some problems in testing,"
			if current_page == 6:
				$Position2D/Label.text = "with people firing the gun while holding objects, so we had to disable firing the gun when holding an object."
			if current_page == 7:
				$Position2D/Label.text = "Don't want fast moving chunks of whatever in your face do we? - RJ"
		if PlayerStats.current_level == 6:
			if current_page == 1:
				$Position2D/Label.text = "This is a Object Wall. It prevent inanimate objects from going through it."
			if current_page == 2:
				$Position2D/Label.text = "Humans and robots and any objects on a whitelist, such as clothes, or any equipment, will be allow through."




func _on_AnimationPlayer_animation_finished(anim_name):
	anim_play = false
	

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		reading = true


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		reading = false
