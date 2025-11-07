extends Node2D

enum BREAK_DIFFICULTY { EASY, MEDIUM, HARD }
enum BREAK_TOOL { PICKAXE, AXE, SHOVEL }

@export var breakable := true
@export var break_difficulty := BREAK_DIFFICULTY.EASY
@export var correct_tool := BREAK_TOOL.PICKAXE


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
