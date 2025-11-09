extends Node2D

enum BREAK_DIFFICULTY { EASY, MEDIUM, HARD }
enum BREAK_TOOL { PICKAXE, AXE, SHOVEL }

@export var break_difficulty := BREAK_DIFFICULTY.EASY
@export var correct_tool := BREAK_TOOL.PICKAXE
@export var block := GLOBAL.BLOCK.COBBLESTONE
@onready var sprite := %Sprite


func _ready() -> void:
	sprite.texture = load(GLOBAL.block_textures.get(block))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
