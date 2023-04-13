extends Sprite2D

class_name Menu

@onready var button = $Button
@export var gameboard: Node2D
@export var backbarrow: Backarrow
@onready var audiomenu: AudioStreamPlayer

func _ready():
	$AudioMenu.play()
	Global.reset.connect(activate)

func activate():
	$AudioMenu.play()
	self.visible = true
	Global.in_game = false
	gameboard.visible = false
	button.disabled = false
	
func deactivate():
	$Button/AudioGameStart.play()
	$AudioMenu.stop()
	self.visible = false
	Global.in_game = true
	gameboard.visible = true
	button.disabled = true
