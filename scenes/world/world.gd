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
	$Route/Teletubbies.progress += speed * delta



func _on_telebatties_timer_timeout():
	var telebatties = telebatties_scene.instantiate() # Replace with function body.
	$Route/Teletubbies.add_child(telebatties)
	
