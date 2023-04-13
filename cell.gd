extends Node2D

class_name Cell

@export var icon: Sprite2D

var has_been_pressed: bool = false

signal placed

func _ready():
	icon.frame = 0
	
	
func _on_button_pressed():
	if has_been_pressed or Global.is_game_over or !Global.in_game:
		return 
		
	has_been_pressed = true
	if Global.turn: 
		icon.frame = 2
	else: 
		icon.frame = 1
	Global.turn = !Global.turn
	
	placed.emit()
