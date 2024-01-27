extends Area2D

signal TeleBatGotIn(body)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	TeleBatGotIn.emit(body) # Replace with function body.
