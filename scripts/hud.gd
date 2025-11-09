extends CanvasLayer

@onready var player := %Player

const TILE_SIZE := 96
const Y_OFFSET := 96 * 18 + 48 # 18 layers from world generation


func _process(_delta: float) -> void:
	var x = snapped(player.position.x / TILE_SIZE, 0.1)
	var y = snapped((-player.position.y + Y_OFFSET) / TILE_SIZE, 0.1)
	
	%Coordinates.text = "x: " + str(x) + "\n"
	%Coordinates.text += "y: " + str(y)
