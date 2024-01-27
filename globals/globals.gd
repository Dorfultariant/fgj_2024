extends Node2D

enum TELEBATTIES {
	RED,
	PURPLE,
	BLUE,
	YELLOW,
	BROWN,
	CYAN,
	NYAN	
}

var preloaded_levels: Array = [preload("res://scenes/world/gameMenuUI.tscn").instantiate(),preload("res://scenes/world/level_1.tscn").instantiate(),preload("res://scenes/world/level_2.tscn").instantiate(),preload("res://scenes/world/level_3.tscn").instantiate(),preload("res://scenes/world/level_4.tscn").instantiate(),]

var follow_paths_list = []
var tower_list = []

var telebatties_queue = Array()
var instructiion_list = Array()
var teleTypes: Array = [null,null,null,null,null,null]
var tower_cost_list = [200]

var player_score : int = 0
const player_level_clearance : int = 10
var is_level_cleared : bool = false

const player_starting_balance = 1000
const ai_starting_balance = 1000
const ai_balance_gained_per_telebattie_killed = 100
const player_balance_gained = 50


var current_level = 0
var current_lap = 0

var player_balance = 0
var ai_balance = 0

const number_of_levels = 4
const number_of_laps = 5

var player_is_alive = true

var ready_for_wave = false

func level_manager():
	player_is_alive = true
	ready_for_wave = false
	current_level = 1
	current_lap = 1
	player_balance = player_starting_balance
	ai_balance = ai_starting_balance
	
	while player_is_alive && current_level <= number_of_levels:
		while player_is_alive && current_lap <= number_of_laps:
			store_menu()
			while !ready_for_wave:
				pass
			wave_begin()
			while false:
				pass
			ready_for_wave = false
			update_player_alive()
			if !player_is_alive:
				player_lost()
			current_lap += 1
		current_level += 1
		current_lap = 1
	if !player_is_alive:
		player_lost()
	player_won()
			

func store_menu():
	get_tree().root.add_child(preloaded_levels[0])

func wave_begin():
	get_tree().root.add_child(preloaded_levels[current_level])
	
func update_player_alive():
		player_is_alive = false
		for n in teleTypes:
			if n != null:
				player_is_alive = true

func player_lost():
	pass
	
func player_won():
	pass

