extends CanvasLayer

@onready var score_label: Label = $Score/HBoxContainer/Score/Label
@onready var score_icon: TextureRect = $Score/HBoxContainer/Score/TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	update_score_text()
	# Connect Globals signal to update_score_text, this way whenever score changes, UI is updated
	Globals.connect("stat_update", update_score_text)


func update_score_text():
	score_label.text = str(Globals.player_score)


