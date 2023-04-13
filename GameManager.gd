extends Node

class_name GameManager

var turn: bool = false
var is_game_over: bool = false
var in_game: bool = false

signal reset

func _input(event):
	if !(is_game_over and in_game):
		return
	if event.is_action_pressed("LClick"):
		
		reset.emit()
