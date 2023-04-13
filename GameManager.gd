extends Node

class_name GameManager

var turn: bool = false
var is_game_over: bool = false:
	set(value):
		if !is_game_over and value:
			game_over.emit()
		is_game_over = value
var in_game: bool = false:
	set(value):
		if !in_game and value:
			is_game_over = false
			turn = false
		in_game = value

signal reset
signal game_over

func emit_reset():
	reset.emit()
