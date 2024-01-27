extends Area2D
var body_list = []
var target_body
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if body_list:
		target_body = body_list[0]
	
	if target_body != null: 
		look_at(target_body.global_position)
	

func _on_body_entered(body):
	body_list.append(body)
	


func _on_body_exited(body):
	body_list.erase(body)
