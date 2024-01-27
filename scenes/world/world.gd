extends Node2D
class_name WORLD

var telebatties_scene: PackedScene = preload("res://scenes/characters/telebatties.tscn")
var tower_scene: PackedScene = preload("res://scenes/towers/tower.tscn")
var trashScene = preload("res://scenes/characters/trash.tscn")
var follow_paths_list = []
var speed : int = 200
#var tower_positions = $TowerPositions.get_children()

# Called when the node enters the scene tree for the first time.
func _ready():
	var tower = tower_scene.instantiate()
	
	tower.position = $TowerPositions/Marker2D.global_position
	$Towers.add_child(tower)
	for i in range(20):
		var telebatties = telebatties_scene.instantiate()
		telebatties.set_parameters(randi_range(0,5), randi_range(0,2))
		Globals.telebatties_queue.append(telebatties)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for follower in follow_paths_list:
		#print("Mach speed: ",follower.get_child(0).speed)
		follower.progress += follower.get_child(0).speed * delta 

func _on_telebatties_timer_timeout():
	pass

func _on_tele_bat_spawn_timer_timeout():
	if Globals.telebatties_queue:
		var newFollowPath = PathFollow2D.new()
		var popped = Globals.telebatties_queue.pop_at(0)
		newFollowPath.add_child(popped)
		var routes = $Routes.get_children()
		routes[popped.path].add_child(newFollowPath)
		follow_paths_list.append(newFollowPath)
		print("New child appears")


func _on_finnish_line_tele_bat_got_in(body):
	print("Something got through...")
	for follower in follow_paths_list:
		var children = follower.get_children()
		if body in children:
			follow_paths_list.erase(follower)
	body.queue_free()

	


func _on_tower_trash_throw(pos, dir):
	var trash = trashScene.instantiate()
	trash.position = pos
	trash.direction = dir
	#trash.velocity.x = target_body.position.x - position.x
	#trash.velocity.y = target_body.position.y - position.y
	$Ammunition.add_child(trash)
