extends Node2D

enum TELETATTIES {
	perkele,
	suotana	
}

var telebatties_queue = Array()


# Called when the node enters the scene tree for the first time.
func _ready():
	print(TELETATTIES.perkele)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
