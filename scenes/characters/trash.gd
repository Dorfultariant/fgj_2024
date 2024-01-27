extends CharacterBody2D


const SPEED = 800.0
const ROTATE_SPEED = 1000

var damage = 50
var pierce
var targetPosition

@export var speed: int = 2500
var direction: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	$SelfDestructTimer.start()


func _process(delta):
	position += direction * SPEED * delta
	rotate(deg_to_rad(ROTATE_SPEED)*delta)
	move_and_slide()

# Handles the destruction of projectile after certain time
func _on_self_destruct_timer_timeout():
	queue_free()


func _on_area_2d_body_entered(body):
	if "Telebatties" in body.name:
		body.hit(damage)
	queue_free() # Replace with function body.
