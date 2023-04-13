extends Node2D

class_name CellManager

enum {
	INVALID,
	CROSS,
	CIRCLE
}

@onready var cell1: Cell = $Cell1
@onready var cell2: Cell = $Cell2
@onready var cell3: Cell = $Cell3 
@onready var cell4: Cell = $Cell4
@onready var cell5: Cell = $Cell5
@onready var cell6: Cell = $Cell6
@onready var cell7: Cell = $Cell7
@onready var cell8: Cell = $Cell8
@onready var cell9: Cell = $Cell9

@onready var h_cells_1: Array[Cell] = [cell1, cell2, cell3]
@onready var h_cells_2: Array[Cell] = [cell4, cell5, cell6]
@onready var h_cells_3: Array[Cell] = [cell7, cell8, cell9]

@onready var cells: Array[Array] = [h_cells_1, h_cells_2, h_cells_3]

@export var winstates: Array[Texture2D]

@export var win_stroke: Sprite2D

var turns: int = 0

func _ready() -> void:
	for x in range(3):
		for y in range(3):
			(cells[x][y] as Cell).placed.connect(check_winstates)
	Global.reset.connect(reset_board)

func check_winstates() -> void:
	turns += 1
	
	for i in range(winstates.size()):
		var image: Image = winstates[i].get_image()
		var positions: Array[Vector2]
		
		for x in range(3):
			for y in range(3):
				if image.get_pixel(x, y).a > 0:
					positions.append(Vector2(x, y))
		
		match is_winning(
			cells[positions[0].x][positions[0].y],
			cells[positions[1].x][positions[1].y],
			cells[positions[2].x][positions[2].y]
		):
			CellManager.INVALID:
				pass
			CellManager.CROSS:
				win(CellManager.CROSS, i)
				return
			CellManager.CIRCLE:
				win(CellManager.CIRCLE, i)
				return
	
	if turns == 9:
		win(CellManager.INVALID, 8)

func win(winner: int, winstate: int) -> void:
	turns = 0
	win_stroke.frame = winstate
	Global.is_game_over = true

func is_winning(cell1: Cell, cell2: Cell, cell3: Cell) -> int:
	if cell1.icon.frame == cell2.icon.frame and cell1.icon.frame == cell3.icon.frame:
		return cell1.icon.frame # Return the frame of the winner
	else:
		return 0

func reset_board() -> void:
	win_stroke.frame = 8
	
	for x in range(3):
		for y in range(3):
			var cell: Cell = cells[x][y] as Cell
			cell.icon.frame = 0
			cell.has_been_pressed = false

