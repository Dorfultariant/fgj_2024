extends Node2D
class_name WORLD

var telebatties_scene: PackedScene = preload("res://scenes/characters/telebatties.tscn")
var tower_scene: PackedScene = preload("res://scenes/towers/tower.tscn")

var speed : int = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	# Starting balances
	Globals.ai_balance = Globals.ai_starting_balane
	Globals.player_balance = Globals.player_starting_balance
	var positionMarkers = $TowerPositions.get_children()
	while (Globals.ai_balance >= Globals.tower_cost_list[0]):
		var tower = tower_scene.instantiate()
		var towerPos = positionMarkers[randi_range(0, positionMarkers.size())]
		# Remove from possible tower positions so two towers dont stack
		positionMarkers.erase(towerPos)
		tower.position = towerPos.global_position
		$Towers.add_child(tower)
		Globals.tower_list.append(tower)
		Globals.ai_balance -= Globals.tower_cost_list[0]

	var TESTLIST = [0,2,1,5,2,2]
	for i in TESTLIST:
		if i != null:
			var telebatties = telebatties_scene.instantiate()
			telebatties.set_parameters(i, randi_range(0,2))
			Globals.telebatties_queue.append(telebatties)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for follower in Globals.follow_paths_list:
		#print("Mach speed: ",follower.get_child(0).speed)
		follower.progress += follower.get_child(0).speed * delta 
	if Globals.player_score == Globals.player_level_clearance:
		Globals.is_level_cleared = true
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


func _on_finnish_line_tele_bat_got_in(body):
	print("Something got through...")
	for follower in Globals.follow_paths_list:
		var children = follower.get_children()
		if body in children:
			Globals.follow_paths_list.erase(follower)
	Globals.player_balance += Globals.player_balance_gained
	Globals.player_score += 1
	body.queue_free()
