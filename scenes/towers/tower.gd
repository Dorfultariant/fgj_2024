extends Area2D

var body_list = []
var target_body

func _process(delta):
	if body_list:
		target_body = body_list[0]

	if target_body != null: 
		look_at(target_body.global_position)

func _on_body_exited(body):
	body_list.erase(body)


