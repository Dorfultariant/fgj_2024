extends Node2D
class_name WORLD
var telebatties_scene: PackedScene = preload("res://scenes/characters/telebatties.tscn")

var speed : int = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	var telebatties = telebatties_scene.instantiate() # Replace with function body.
	$Route/RoutedObjects/Telebatties.add_child(telebatties)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Route/RoutedObjects.progress += speed * delta
	


func _on_telebatties_timer_timeout():
	var telebatties = telebatties_scene.instantiate() # Replace with function body.
	$Route/RoutedObjects/Telebatties.add_child(telebatties)
	
