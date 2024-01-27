extends Control

@onready var dropdown_menu = $ColorRect/Panel/OptionButton
@onready var dropdown_menu2 = $ColorRect/Panel/OptionButton2
@onready var rect = $ColorRect/Panel/TextureRect
@onready var money_textEdit = $ColorRect/Panel/money_textEdit
# Called when the node enters the scene tree for the first time.

var selected_spot : int = 1
var selected_TELE : int = 1
var cost : int = 100
var teleList: Array = [0,0,0,0,0,0]


var prices_to_int = {100: 0, 200: 1, 400: 2, 600: 3, 800: 4, 1000: 5}


func add_item():
	dropdown_menu.add_item("Telebattie: 1 Price: 100")
	dropdown_menu.set_item_metadata(0, 100)
	dropdown_menu.add_item("Telebattie: 2 Price: 200")
	dropdown_menu.set_item_metadata(1, 200)
	dropdown_menu.add_item("Telebattie: 3 Price: 400")
	dropdown_menu.set_item_metadata(2, 400)
	dropdown_menu.add_item("Telebattie: 4 Price: 600")
	dropdown_menu.set_item_metadata(3, 600)
	dropdown_menu.add_item("Telebattie: 5 Price: 800")
	dropdown_menu.set_item_metadata(4, 800)
	dropdown_menu.add_item("Telebattie: 6 Price: 1000")
	dropdown_menu.set_item_metadata(5, 1000)
	
	dropdown_menu2.add_item("1. slot")
	dropdown_menu2.add_item("2. slot")
	dropdown_menu2.add_item("3. slot")
	dropdown_menu2.add_item("4. slot")
	dropdown_menu2.add_item("5. slot")
	dropdown_menu2.add_item("6. slot")
	
func _ready():
	money_textEdit.text = str(Globals.player_balance)
	add_item()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_option_button_item_selected(index):
	selected_TELE = index+1
	
	cost = dropdown_menu.get_item_metadata(index)
	if index == 0:
		var telebattie = preload("res://resources/characters/telebattiesRED.png")
		rect.texture = telebattie
	if index == 1:
		var telebattie = preload("res://resources/characters/telebattiesBLUE.png")
		rect.texture = telebattie
	if index == 2:
		var telebattie = preload("res://resources/characters/telebattiesGREEN.png")
		rect.texture = telebattie
	if index == 3:
		var telebattie = preload("res://resources/characters/telebattiesLIGHTBLUE.png")
		rect.texture = telebattie
	if index == 4:
		var telebattie = preload("res://resources/characters/telebattiesPINK.png")
		rect.texture = telebattie
	if index == 5:
		var telebattie = preload("res://resources/characters/telebattiesVIOLET.png")
		rect.texture = telebattie
		
		


func _on_button_pressed():
	#for i in range(1,7):
	#	var item = get_node("ColorRect/ItemList/Item"+str(i))
	#	if item.texture == null:
	#		item.texture = rect.texture
	#		break
	if cost <= Globals.player_balance:
		var item = get_node("ColorRect/ItemList/Item"+str(selected_spot))
		if item.texture == null:
			item.texture = rect.texture
			Globals.player_balance -= cost
			teleList[selected_spot-1] = cost
		else:
			Globals.player_balance += teleList[selected_spot-1]
			item.texture = rect.texture
			Globals.player_balance -= cost
		Globals.teleTypes[selected_spot-1] = prices_to_int[cost]
	money_textEdit.text = str(Globals.player_balance)
			
	#var new_rect = TextureRect.new()
	#new_rect.texture = rect.texture
	#$ColorRect/ItemList.add_child(new_rect)



func _on_option_button_2_item_selected(index):
	selected_spot = index+1
