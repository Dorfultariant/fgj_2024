extends Area2D

var body_list = []
var target_body
var canShoot = false
const RELOADTIME = 1.2
var loadTime = RELOADTIME
# Called when the node enters the scene tree for the first time.
var trashScene = preload("res://scenes/characters/trash.tscn")
signal trashThrow(pos, dir)

func _init():

	pass

func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if body_list:
		target_body = body_list[0]
	
	if target_body != null: 
		look_at(target_body.global_position)
		if loadTime <= 0:
			loadTime = RELOADTIME
			canShoot = true
		else:
			canShoot = false
	else:
		canShoot = false
	loadTime = loadTime - delta
	

func _on_body_entered(body):
	body_list.append(body)
	
func _on_body_exited(body):
	body_list.erase(body)


