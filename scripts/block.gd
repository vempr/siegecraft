extends Node2D

var break_difficulty: GLOBAL.BREAK_DIFFICULTY
var correct_tool: GLOBAL.BREAK_TOOL
@export var block := GLOBAL.BLOCK.COBBLESTONE
@onready var sprite := %Sprite
@onready var breaking_sprite := %AnimatedSprite
@onready var player := get_parent().get_node("Player")
var can_mine := false
var is_mining := false


func _ready() -> void:
	sprite.texture = load(GLOBAL.block_textures.get(block))
	breaking_sprite.visible = false


func _process(_delta: float) -> void:
	if Input.is_action_pressed("mine") && can_mine && !is_mining:
		player.mining_toggled.emit(true)
		is_mining = true
		breaking_sprite.visible = true
		breaking_sprite.play("mine")
	
	elif (!Input.is_action_pressed("mine") || !can_mine) && is_mining:
		player.mining_toggled.emit(false)
		is_mining = false
		breaking_sprite.visible = false
		breaking_sprite.stop()


func _on_mouse_entered() -> void:
	can_mine = true


func _on_mouse_exited() -> void:
	can_mine = false


func _on_animated_sprite_animation_finished() -> void:
	print(GLOBAL.blocks[block]["breaking_result"])
	player.mining_toggled.emit(false)
	queue_free()
