extends CanvasLayer


@onready var btn_1 = $MarginContainer/HBoxContainer/ButtonBar/Button
@onready var btn_2 = $MarginContainer/HBoxContainer/ButtonBar/Button2
@onready var btn_3 = $MarginContainer/HBoxContainer/ButtonBar/Button3
@onready var btn_4 = $MarginContainer/HBoxContainer/ButtonBar/Button4
@onready var btn_5 = $MarginContainer/HBoxContainer/ButtonBar/Button5
@onready var btn_6 = $MarginContainer/HBoxContainer/ButtonBar/Button6

@onready var label_1 = $MarginContainer/HBoxContainer/ButtonBar/Label
@onready var label_2 = $MarginContainer/HBoxContainer/ButtonBar/Label2
@onready var label_3 = $MarginContainer/HBoxContainer/ButtonBar/Label3
@onready var label_4 = $MarginContainer/HBoxContainer/ButtonBar/Label4
@onready var label_5 = $MarginContainer/HBoxContainer/ButtonBar/Label5
@onready var label_6 = $MarginContainer/HBoxContainer/ButtonBar/Label6

@onready var red = preload("res://resources/characters/red.png")
@onready var green = preload("res://resources/characters/green.png")
@onready var purple = preload("res://resources/characters/purple.png")
@onready var pink = preload("res://resources/characters/pink.png")
@onready var lightblue = preload("res://resources/characters/lightblue.png")
@onready var blue = preload("res://resources/characters/blue.png")


#var teletub_list = ["RED", "PURPLE", "BLUE", "YELLOW", "BROWN", "CYAN"]
func _ready():
	Globals.teleTypes = []
	Globals.current_lap += 1
	if Globals.current_lap > Globals.number_of_laps:
		TransitionLayer.change_scene("res://scenes/world/lose_screen.tscn")
	elif Globals.is_level_cleared:
		Globals.is_level_cleared = false
		Globals.current_level += 1
		Globals.current_lap = 1
		Globals.reset_player()
		Globals.reset_ai()
	
	$MarginContainer4/Label.text = str(Globals.player_balance)
	btn_1.text = Globals.teletub_list[0]
	label_1.text = str(Globals.teletub_cost_list[0])
	btn_2.text = Globals.teletub_list[1]
	label_2.text = str(Globals.teletub_cost_list[1])
	btn_3.text = Globals.teletub_list[2]
	label_3.text = str(Globals.teletub_cost_list[2])
	btn_4.text = Globals.teletub_list[3]
	label_4.text = str(Globals.teletub_cost_list[3])
	btn_5.text = Globals.teletub_list[4]
	label_5.text = str(Globals.teletub_cost_list[4])
	btn_6.text = Globals.teletub_list[5]
	label_6.text = str(Globals.teletub_cost_list[5])



var q_position = 0
func insert_to_queue(rect):
	#queue_list[index].texture = tabbi_list[index]
	#$MarginContainer2/HBoxContainer/Queue.texture = red
	if q_position == 0:
		$MarginContainer2/HBoxContainer/Queue.texture = rect
	elif q_position == 1:
		$MarginContainer2/HBoxContainer/Queue2.texture = rect
	elif q_position == 2:
		$MarginContainer2/HBoxContainer/Queue3.texture = rect
	elif q_position == 3:
		$MarginContainer2/HBoxContainer/Queue4.texture = rect
	elif q_position == 4:
		$MarginContainer2/HBoxContainer/Queue5.texture = rect
	elif q_position == 5:
		$MarginContainer2/HBoxContainer/Queue6.texture = rect
	$MarginContainer4/Label.text = str(Globals.player_balance)
	
	q_position += 1

func _on_button_button_down():
	if Globals.player_balance < Globals.teletub_cost_list[0] or Globals.teleTypes.size() == Globals.teleTypesMaxSize:
		return
	Globals.player_balance -= Globals.teletub_cost_list[0]
	Globals.teleTypes.append(0)
	#var rect = preload("res://resources/characters/telebattiesRED.png")
	insert_to_queue(red)

func _on_button_2_button_down():
	if Globals.player_balance < Globals.teletub_cost_list[1] or Globals.teleTypes.size() == Globals.teleTypesMaxSize:
		return
	Globals.player_balance -= Globals.teletub_cost_list[1]
	Globals.teleTypes.append(1)
	#var rect = preload("res://resources/characters/telebattiesBLUE.png")
	insert_to_queue(purple)
	
func _on_button_3_button_down():
	if Globals.player_balance < Globals.teletub_cost_list[2] or Globals.teleTypes.size() == Globals.teleTypesMaxSize:
		return
	Globals.player_balance -= Globals.teletub_cost_list[2]
	Globals.teleTypes.append(2)
	
	#var rect = preload("res://resources/characters/telebattiesGREEN.png")
	insert_to_queue(green)
	
func _on_button_4_button_down():
	if Globals.player_balance < Globals.teletub_cost_list[3] or Globals.teleTypes.size() == Globals.teleTypesMaxSize:
		return
	Globals.player_balance -= Globals.teletub_cost_list[3]
	Globals.teleTypes.append(3)
	
	#var rect = preload("res://resources/characters/telebattiesLIGHTBLUE.png")
	insert_to_queue(lightblue)
func _on_button_5_button_down():
	if Globals.player_balance < Globals.teletub_cost_list[4] or Globals.teleTypes.size() == Globals.teleTypesMaxSize:
		return
	Globals.player_balance -= Globals.teletub_cost_list[4]
	Globals.teleTypes.append(4)

	#var rect = preload("res://resources/characters/telebattiesPINK.png")
	insert_to_queue(pink)


func _on_button_6_button_down():
	if Globals.player_balance < Globals.teletub_cost_list[5] or Globals.teleTypes.size() == Globals.teleTypesMaxSize:
		return
	Globals.player_balance -= Globals.teletub_cost_list[5]
	Globals.teleTypes.append(5)
	#var rect = preload("res://resources/characters/telebattiesVIOLET.png")
	insert_to_queue(blue)


func _on_play_btn_button_down():
	if Globals.teleTypes.size() > 0:
		TransitionLayer.change_scene("res://scenes/world/level_"+str(Globals.current_level)+".tscn")
