extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$VideoStreamPlayer.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$VideoStreamPlayer.get
	
	pass


func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://scenes/UI/shop_menu.tscn")
	pass # Replace with function body.
