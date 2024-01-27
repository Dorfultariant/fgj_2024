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
const ai_starting_balane = 1000
const ai_balance_gained_per_telebattie_killed = 100
const player_balance_gained = 50


var player_balance = 0
var ai_balance = 0
