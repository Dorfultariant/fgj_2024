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

var telebatties_queue = Array()
var instructiion_list = Array()
var teleTypes: Array = [null,null,null,null,null,null]

const player_starting_balance = 1000
const ai_starting_balane = 1000
const ai_balance_gained_per_telebattie_killed = 100

var player_balance = 0
var ai_balance = 0
