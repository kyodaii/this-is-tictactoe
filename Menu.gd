extends Sprite2D

class_name Menu

@onready var button = $Button
@export var gameboard: Node2D

func _ready():
	Global.reset.connect(activate)

func activate():
	self.visible = true
	Global.in_game = false
	gameboard.visible = false
	button.disabled = false
	
func deactivate():
	self.visible = false
	Global.in_game = true
	gameboard.visible = true
	button.disabled = true
