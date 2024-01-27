extends Area2D
var body_list = []
var target_body
var is_loaded : bool = true
var ball_scene : PackedScene = preload("res://scenes/towers/ball.tscn")

func _process(delta):
	if body_list:
		target_body = body_list[0]

	if target_body != null: 
		look_at(target_body.global_position)

	if is_loaded and target_body:
		var ball = ball_scene.instantiate()
		get_tree().root.add_child(ball)
		ball.position = $ThrowPoint.global_position
		ball.target_direction = (ball.position - target_body.global_position).normalized()
		$Projectiles.add_child(ball)
		is_loaded = false

func _on_body_entered(body):
	body_list.append(body)


func _on_body_exited(body):
	body_list.erase(body)


func _on_throw_timer_timeout():
	is_loaded = true
