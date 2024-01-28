extends Node2D
class_name WORLD

var telebatties_scene: PackedScene = preload("res://scenes/characters/telebatties.tscn")
var tower_scene: PackedScene = preload("res://scenes/towers/tower.tscn")

var speed : int = 500
var can_die

# Called when the node enters the scene tree for the first time.
func _ready():
	can_die = false
	var positionMarkers = $TowerPositions.get_children()
	while (Globals.ai_balance >= Globals.tower_cost_list[0]):
		var tower = tower_scene.instantiate()
		var towerPos = positionMarkers[randi_range(0, positionMarkers.size()+1)-1]
		
		# Remove from possible tower positions so two towers dont stack
		positionMarkers.erase(towerPos)
		tower.position = towerPos.global_position
		$Towers.add_child(tower)
		Globals.tower_list.append(tower)
		Globals.ai_balance -= Globals.tower_cost_list[0]

	for i in Globals.teleTypes:
		if i != null:
			var telebatties = telebatties_scene.instantiate()
			telebatties.set_parameters(i, randi_range(0,$Routes.get_children().size()-1))
			Globals.telebatties_queue.append(telebatties)

func _process(delta):
	for follower in Globals.follow_paths_list:
		#print("Mach speed: ",follower.get_child(0).speed)
		if follower != null:
			follower.progress += follower.get_child(0).speed * delta 
	if Globals.player_score == Globals.player_level_clearance:
		Globals.is_level_cleared = true
		TransitionLayer.change_scene("res://scenes/UI/shop_menu.tscn")
	elif can_die && Globals.follow_paths_list.size() == 0:
		Globals.is_level_cleared = false
		TransitionLayer.change_scene("res://scenes/UI/shop_menu.tscn")

func _on_telebatties_timer_timeout():
	pass
	
func _on_tele_bat_spawn_timer_timeout():
	if Globals.telebatties_queue:
		var newFollowPath = PathFollow2D.new()
		var popped = Globals.telebatties_queue.pop_at(0)
		newFollowPath.add_child(popped)
		var routes = $Routes.get_children()
		routes[popped.path].add_child(newFollowPath)
		Globals.follow_paths_list.append(newFollowPath)
		can_die = true


func _on_finnish_line_tele_bat_got_in(body):
	print("Something got through...")
	for follower in Globals.follow_paths_list:
		var children = follower.get_children()
		if body in children:
			Globals.follow_paths_list.erase(follower)
	Globals.player_balance += Globals.player_balance_gained
	Globals.player_score += 1
	body.queue_free()
