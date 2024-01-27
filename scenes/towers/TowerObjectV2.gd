extends Area2D
var body_list = []
var target_body
var damage = 1
const RELOADTIME = 1.2
var loadTime = RELOADTIME
var trashScene = preload("res://scenes/characters/trash.tscn")
# Called when the node enters the scene tree for the first time.

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if body_list:
		target_body = body_list[0]
	
	if target_body != null: 
		look_at(target_body.global_position)
		if loadTime <= 0:
			# DOTO throwTrash(target_body)
			loadTime = RELOADTIME
			throwTrash()
			
	loadTime = loadTime - delta
	


	
func _on_area_2d_body_entered(body):
	if "Telebatties" in body.name:
		body_list.append(body)

func _on_area_2d_body_exited(body):
	if body in body_list:
		body_list.erase(body)
		
func throwTrash():
	var trash = trashScene.instantiate()
	if randi_range(0, 1) == 1:
		trash.position = $MarkerRightHand2.global_position
		trash.direction = (target_body.global_position - $MarkerRightHand2.global_position).normalized()
	else:
		trash.position = $MarkerLeftHand2.global_position
		trash.direction = (target_body.global_position - $MarkerLeftHand2.global_position).normalized()
	trash.damage = damage
	get_node("AmmunitionHolder").add_child(trash)
