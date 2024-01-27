extends Control

@onready var dropdown_menu = $ColorRect/Panel/OptionButton
@onready var dropdown_menu2 = $ColorRect/Panel/OptionButton2
@onready var rect = $ColorRect/Panel/TextureRect
@onready var money_textEdit = $ColorRect/Panel/money_textEdit
# Called when the node enters the scene tree for the first time.

var selected_spot : int = 1
var selected_TELE : int = 1
var money : int = 2000
var cost : int = 100
var teleList: Array = [0,0,0,0,0,0]

func add_item():
	dropdown_menu.add_item("Teletubbie: 1 Price: 100")
	dropdown_menu.set_item_metadata(0, 100)
	dropdown_menu.add_item("Teletubbie: 2 Price: 200")
	dropdown_menu.set_item_metadata(1, 200)
	dropdown_menu.add_item("Teletubbie: 3 Price: 400")
	dropdown_menu.set_item_metadata(2, 400)
	dropdown_menu.add_item("Teletubbie: 4 Price: 600")
	dropdown_menu.set_item_metadata(3, 600)
	dropdown_menu.add_item("Teletubbie: 5 Price: 800")
	dropdown_menu.set_item_metadata(4, 800)
	dropdown_menu.add_item("Teletubbie: 6 Price: 1000")
	dropdown_menu.set_item_metadata(5, 1000)
	
	dropdown_menu2.add_item("1. Teletubbie")
	dropdown_menu2.add_item("2. Teletubbie")
	dropdown_menu2.add_item("3. Teletubbie")
	dropdown_menu2.add_item("4. Teletubbie")
	dropdown_menu2.add_item("5. Teletubbie")
	dropdown_menu2.add_item("6. Teletubbie")
	
func _ready():
	money_textEdit.text = str(money)
	add_item()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_option_button_item_selected(index):
	selected_TELE = index+1
	cost = dropdown_menu.get_item_metadata(index)
	if index == 0:
		var telethubbie = preload("res://resources/characters/telebattiesRED.png")
		rect.texture = telethubbie
	if index == 1:
		var telethubbie = preload("res://resources/characters/telebattiesBLUE.png")
		rect.texture = telethubbie
	if index == 2:
		var telethubbie = preload("res://resources/characters/telebattiesGREEN.png")
		rect.texture = telethubbie
	if index == 3:
		var telethubbie = preload("res://resources/characters/telebattiesLIGHTBLUE.png")
		rect.texture = telethubbie
	if index == 4:
		var telethubbie = preload("res://resources/characters/telebattiesPINK.png")
		rect.texture = telethubbie
	if index == 5:
		var telethubbie = preload("res://resources/characters/telebattiesVIOLET.png")
		rect.texture = telethubbie
		
		


func _on_button_pressed():
	#for i in range(1,7):
	#	var item = get_node("ColorRect/ItemList/Item"+str(i))
	#	if item.texture == null:
	#		item.texture = rect.texture
	#		break
	if cost <= money:
		var item = get_node("ColorRect/ItemList/Item"+str(selected_spot))
		if item.texture == null:
			item.texture = rect.texture
			money = money - cost
			teleList[selected_spot-1] = cost
		else:
			money += teleList[selected_spot-1]
			item.texture = rect.texture
			money = money - cost
	money_textEdit.text = str(money)
			
	#var new_rect = TextureRect.new()
	#new_rect.texture = rect.texture
	#$ColorRect/ItemList.add_child(new_rect)



func _on_option_button_2_item_selected(index):
	selected_spot = index+1
