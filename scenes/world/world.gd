extends Node2D
class_name WORLD
var telebatties_scene: PackedScene = preload("res://scenes/characters/telebatties.tscn")

var speed : int = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	print(Globals.telebatties_queue)
	var telebatties = telebatties_scene.instantiate() # Replace with function body.
	$Route/Teletubbies.add_child(telebatties)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.telebatties_queue:
		for tub in Globals.telebatties_queue:
			$Route/Teletubbies.add_child(tub)
		Globals.telebatties_queue.empty


func _on_telebatties_timer_timeout():
	var telebatties = telebatties_scene.instantiate() # Replace with function body.
	Globals.telebatties_queue.append(telebatties)


func _on_tele_bat_spawn_timer_timeout():
	var newFollowPath = PathFollow2D.new()
	newFollowPath.add_child(Globals.telebatties_queue.pop_at(0))
	$Route.add_child(newFollowPath)


func _on_finnish_line_tele_bat_got_in(body):
	pass # Replace with function body.
