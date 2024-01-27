extends Area2D
var body_list = []
var target_body
const RELOADTIME = 1.2
var loadTime = RELOADTIME
# Called when the node enters the scene tree for the first time.
var trashScene = preload("res://scenes/characters/trash.tscn")
signal trashThrow(pos, dir)

func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if body_list:
		target_body = body_list[0]
	
	if target_body != null: 
		look_at(target_body.global_position)
		if loadTime <= 0:
			throwTrash(target_body)
			loadTime = RELOADTIME
	loadTime = loadTime - delta
	

func _on_body_entered(body):
	body_list.append(body)
	
func _on_body_exited(body):
	body_list.erase(body)

func throwTrash(target_body):
	if randi_range(0, 1) == 1:
		trashThrow.emit($Marker2DRight.global_position, (target_body.global_position - $Marker2DRight.global_position).normalized() )
	else:
		trashThrow.emit($Marker2DLeft.global_position, (target_body.global_position - $Marker2DLeft.global_position).normalized() )
