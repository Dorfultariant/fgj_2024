extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0
const ROTATE_SPEED = 200

# Get the gravity from the project settings to be synced with RigidBody nodes.
var damage
var pierce
var targetPosition
@export var speed: int = 2500
var direction: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	#$SelfDestructTimer.start()
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * SPEED * delta
	rotate(deg_to_rad(SPEED)*delta)

# Handles the destruction of projectile after certain time
func _on_self_destruct_timer_timeout():
	queue_free()


func _on_body_entered(body):
	if "hit" in body:
		body.hit()
	queue_free() # Replace with function body.
