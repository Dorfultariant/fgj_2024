extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func playSound():
	var instance = AudioStreamPlayer.new()
	instance.finished.connect(removeSound.bind(instance))
	add_child(instance)
	instance.play()
	
func removeSound(instance):
	instance.queue_free()
