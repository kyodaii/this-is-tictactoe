extends Sprite2D

class_name Backarrow

@onready var button: Button = $Button

func _ready() -> void:
	deactivate()
	Global.game_over.connect(activate)
	button.pressed.connect(back)

func activate():
	$AudioGameWon.play()
	self.visible = true
	button.disabled = false

func deactivate():
	$AudioGameRestart.play()
	self.visible = false
	button.disabled = true

func back() -> void:
	Global.emit_reset()
	deactivate()
