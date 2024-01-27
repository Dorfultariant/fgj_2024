extends CharacterBody2D

var speed : int = 600
var target_direction


func start(pos):
	global_position = pos
	# Set the direction and speed of the projectile1

func _physics_process(delta):
	move_and_collide(velocity * delta)



func _on_self_destruct_timeout():
	queue_free()
