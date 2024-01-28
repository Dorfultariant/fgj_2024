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

var teletub_list = ["RED", "PURPLE", "GREEN", "LIGHT", "PINK", "BLUE"]
var teletub_cost_list = [100, 200, 400, 600, 800, 1000]

signal stat_update

var follow_paths_list = []
var tower_list = []

var telebatties_queue = Array()
var instructiion_list = Array()
var teleTypes: Array = []
const teleTypesMaxSize = 6
var tower_cost_list = [200]

var player_score = 0 : 
	get:
		return player_score
	set(value):
		player_score = value
		stat_update.emit()
		
const player_level_clearance : int = 4
var is_level_cleared : bool = false

const player_starting_balance = 1000
const ai_starting_balance = 1000
const ai_balance_gained_per_telebattie_killed = 100
const player_balance_gained = 500

var testLevel = 0

var current_level = 0
var current_lap = 0

var player_balance = 0
var ai_balance = 0

const number_of_levels = 4
const number_of_laps = 5

var player_is_alive = true

var ready_for_wave = false

func reset_ai():
	ai_balance = ai_starting_balance
	tower_list = []

func reset_player():
	player_balance = player_starting_balance
	player_score = 0
	is_level_cleared = false
	follow_paths_list = []
	

