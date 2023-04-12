extends Node2D

class_name Cell

@export var icon: Sprite2D

var has_been_pressed: bool = false

func _ready():
	icon.frame = 0
	
	
func _on_button_pressed():
	if has_been_pressed:
		return
		
	has_been_pressed = true
	if Global.turn: 
		icon.frame = 1
	else: 
		icon.frame = 2
	Global.turn = !Global.turn
