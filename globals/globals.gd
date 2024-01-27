extends Node2D

enum TELETATTIES {
	perkele,
	suotana	
}


# Called when the node enters the scene tree for the first time.
func _ready():
	print(TELETATTIES.perkele)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
