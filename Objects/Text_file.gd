extends Node2D

var reading = false
var anim_play = false
var current_anim = "idle"
var current_page = 1
var max_page = 1

func _ready():
	current_page = 1


func _process(delta):
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
		max_page = 4
	if PlayerStats.current_level == 7:
		max_page = 5
	if PlayerStats.current_level == 8:
		max_page = 6
	if PlayerStats.current_level == 11:
		max_page = 4

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
		$Position2D.set_scale(Vector2(1,1))

		if current_page == 1:
			$Position2D/Left_arrow.set_scale(Vector2(0,0)) 
		else:
			$Position2D/Left_arrow.set_scale(Vector2(0.4,0.4)) 
		if current_page == max_page:
			$Position2D/Right_arrow.set_scale(Vector2(0,0)) 
		else:
			$Position2D/Right_arrow.set_scale(Vector2(0.4,0.4)) 
		
		if PlayerStats.current_level == 1:
			if current_page == 1:
				$Position2D/Text_box/Label.set_text("< Fe-Zn-Al")
		if PlayerStats.current_level == 2:
			if current_page == 1:
				$Position2D/Text_box/Label.set_text("You see the button down in the corner?")
			if current_page == 2:
				$Position2D/Text_box/Label.set_text("This resets the room you are in back to whenever you entered it.")
			if current_page == 3:
				$Position2D/Text_box/Label.set_text("the process may be mysterious but don't worry,")
			if current_page == 4:
				$Position2D/Text_box/Label.set_text("it doesn't hurt. - RJ")
		if PlayerStats.current_level == 3:
			if current_page == 1:
				$Position2D/Text_box/Label.set_text("Artificial Intelligence Devlopment Log #7")
			if current_page == 2:
				$Position2D/Text_box/Label.set_text("We have managed to put the AI in devlopment into a Robot body.")
			if current_page == 3:
				$Position2D/Text_box/Label.set_text("It has very similar capablities to humans,")
			if current_page == 4:
				$Position2D/Text_box/Label.set_text("aside from jump height, and material strength, that thing can't be injured,")
			if current_page == 5:
				$Position2D/Text_box/Label.set_text("well, if it could understand that, I had to downgrade it's capablitiies.")
			if current_page == 6:
				$Position2D/Text_box/Label.set_text("It can just do basic test chambers as of now,")
			if current_page == 7:
				$Position2D/Text_box/Label.set_text("picking up boxes and putting them on buttons to open doors. Quite simple. -RJ")
		if PlayerStats.current_level == 4:
			if current_page == 1:
				$Position2D/Text_box/Label.set_text("Artifical Intelligence Devlopment Log #4")
			if current_page == 2:
				$Position2D/Text_box/Label.set_text("We have made progress, the AI has capablities of solving basic puzzles,")
			if current_page == 3:
				$Position2D/Text_box/Label.set_text("Where does the square go? , What is greater, 5 or 1?, etc.")
			if current_page == 4:
				$Position2D/Text_box/Label.set_text("I'll try to make it more intellengent for now, while I have a greater puzzle to figure out. - RJ")
		if PlayerStats.current_level == 5:
			if current_page == 1:
				$Position2D/Text_box/Label.set_text("Presenting, the Long Range Shockwave Projectile Launching Device!")
			if current_page == 2:
				$Position2D/Text_box/Label.set_text("also known as the Shockwave Gun.")
			if current_page == 3:
				$Position2D/Text_box/Label.set_text("When this thing shoots, the resulting explosion launches anything... except the user")
			if current_page == 4:
				$Position2D/Text_box/Label.set_text("Nothing is harmed when hit. Useful for getting things down from high places.")
			if current_page == 5:
				$Position2D/Text_box/Label.set_text("It can also hold objects out front of it, though, there were some problems in testing,")
			if current_page == 6:
				$Position2D/Text_box/Label.set_text("people were firing the gun while holding objects, so we had to disable firing the gun when holding an object.")
			if current_page == 7:
				$Position2D/Text_box/Label.set_text("Don't want fast moving chunks of whatever in your face do we? - RJ")
		if PlayerStats.current_level == 6:
			if current_page == 1:
				$Position2D/Text_box/Label.set_text("This is a Object Wall. It prevents inanimate objects from going through it.")
			if current_page == 2:
				$Position2D/Text_box/Label.set_text("Humans, robots, any whitelisted objects, such as clothes, any equipment, will be allowed through.")
			if current_page == 3:
				$Position2D/Text_box/Label.set_text("Anything unauthorized will be blocked from going past,")
			if current_page == 4:
				$Position2D/Text_box/Label.set_text("this inculdes any other authorized things if with such an object. -RJ")
		if PlayerStats.current_level == 7:
			if current_page == 1:
				$Position2D/Text_box/Label.set_text("Artifical Intelligence Devlopment Log #3")
			if current_page == 2:
				$Position2D/Text_box/Label.set_text("Honestly, It's really hard to try to make a very smart robot in a small body, not alot of space for computing")
			if current_page == 3:
				$Position2D/Text_box/Label.set_text("Well, at least the reactor in the body works... can be quite dangerous though, Hydrogen Peroxide and just Hydrogen.")
			if current_page == 4:
				$Position2D/Text_box/Label.set_text("Thank god for the extracter that I built, this would be expensive to make that fuel otherwise.")
			if current_page == 5:
				$Position2D/Text_box/Label.set_text("So not much progress made for now... I'll continue working on this. -RJ")
		if PlayerStats.current_level == 8:
			if current_page == 1:
				$Position2D/Text_box/Label.set_text("Artifical Intelligence Devlopment Log #1")
			if current_page == 2:
				$Position2D/Text_box/Label.set_text("This is the first of many logs to be made relating to this project.")
			if current_page == 3:
				$Position2D/Text_box/Label.set_text("The uhh, aim for this project is to make a robot that can escape from, pretty much anything that doesn't kill it.")
			if current_page == 4:
				$Position2D/Text_box/Label.set_text("The start of this project is to, well, make an AI that can comprehend any sort of puzzle.")
			if current_page == 5:
				$Position2D/Text_box/Label.set_text("Human knowledge is needed to understand what is likely ask by a human, if trapped.")
			if current_page == 6:
				$Position2D/Text_box/Label.set_text("For now, i'll probably try to code a basic brain, I'll say any progress I've made next time. - RJ")
		if PlayerStats.current_level == 11:
			if current_page == 1:
				$Position2D/Text_box/Label.set_text("This is a launcher")
			if current_page == 2:
				$Position2D/Text_box/Label.set_text("This will, well. launch objects placed on it.")
			if current_page == 3:
				$Position2D/Text_box/Label.set_text("Our boxes are renforced so it's all good, nothing inside them or themselves are damaged from the launch.")
			if current_page == 4:
				$Position2D/Text_box/Label.set_text("Warning, unless you are a reinforced robot, do not stand on the launcher,")
			if current_page == 4:
				$Position2D/Text_box/Label.set_text("or you will sustain serious damage. - RJ")

func _on_AnimationPlayer_animation_finished(anim_name):
	anim_play = false
	

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		reading = true


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		reading = false


func _on_Left_arrow_pressed():
	current_page -= 1
	if current_page < 1:
		current_page = 1


func _on_Right_arrow_pressed():
	current_page += 1
	if current_page > max_page:
		current_page = max_page


func _on_Left_arrow_mouse_entered():
	PlayerStats.ui_block = true


func _on_Left_arrow_mouse_exited():
	PlayerStats.ui_block = false

func _on_Right_arrow_mouse_entered():
	PlayerStats.ui_block = true


func _on_Right_arrow_mouse_exited():
	PlayerStats.ui_block = false
