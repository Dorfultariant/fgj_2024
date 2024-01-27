extends Button

var simultanious_scene = preload("res://scenes/world/world.tscn").instantiate()


func _on_pressed():
	get_tree().root.add_child(simultanious_scene)
	queue_free()
