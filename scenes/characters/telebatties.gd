extends CharacterBody2D

var type : int = Globals.TELEBATTIES.BLUE
var health : int = 0
var speed : int = 200
var path : int = 0
var cost : int = 0


func set_parameters(new_type, new_path):
	type = new_type
	$Sprite2D.frame = type
	path = new_path
	if type == 0:
		health = 200
		speed = 250
		cost = 100
	elif type == 1:
		health = 300
		speed = 150
		cost = 120
	elif type == 2:
		health = 120
		speed = 500
		cost = 200
	elif type == 3:
		health = 300
		speed = 350
		cost = 150
	elif type == 4:
		health = 600
		speed = 200
		cost = 300
	elif type == 5:
		health = 260
		speed = 175
		cost = 140
		
func _process(delta):
	if health <= 0:
		Globals.ai_balance += Globals.ai_balance_gained_per_telebattie_killed
		for follower in Globals.follow_paths_list:
			var children = follower.get_children()
			if self in children:
				Globals.follow_paths_list.erase(follower)
		Globals.teleTypes.erase(self)
		queue_free()
	
func hit(amount):
	if health > 0:
		health -= amount
		
