extends Node2D
class_name WORLD

var telebatties_scene: PackedScene = preload("res://scenes/characters/telebatties.tscn")
var follow_paths_list = []
var speed : int = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(20):
		var telebatties = telebatties_scene.instantiate() # Replace with function body.
		Globals.telebatties_queue.append(telebatties)
		print(Globals.telebatties_queue.size())
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
		newFollowPath.add_child(Globals.telebatties_queue.pop_at(0))
		$Route.add_child(newFollowPath)
		follow_paths_list.append(newFollowPath)
		print("New child appears")


func _on_finnish_line_tele_bat_got_in(body):
	print("Something got through...")
	for follower in follow_paths_list:
		var children = follower.get_children()
		if body in children:
			follow_paths_list.erase(follower)
	body.queue_free()
