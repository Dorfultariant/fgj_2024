extends Node2D

var money
# Called when the node enters the scene tree for the first time.
var trashScene = preload("res://scenes/characters/trash.tscn")
var towerScene = preload("res://scenes/towers/TowerObjectV2.tscn")
func _ready():
	placeTower()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if money:
		placeTower()
	for i in get_children(false):
		#print(i.global_position)
		if i.name == "Area2D":
			i.epic_process(delta)
			if i.canShoot:
				var trash = trashScene.instantiate()
				if randi_range(0, 1) == 1:
					trash.position = i.Marker2DRightHand.global_position
					trash.direction = (i.target_body.global_position - i.Marker2DRightHand.global_position).normalized()
				else:
					trash.position = i.Marker2DLeftHand.global_position
					trash.direction = (i.target_body.global_position - i.Marker2DLeftHand.global_position).normalized()
				self.add_child(trash)
	
	
func placeTower():
	var tower = towerScene.instantiate()
	
	tower.position = $Marker2D.global_position
	self.add_child(tower)
	for i in get_children():
		print(i.global_position)

	

