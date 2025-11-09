extends Node2D

var break_difficulty: GLOBAL.BREAK_DIFFICULTY
var correct_tool: GLOBAL.BREAK_TOOL

@export var block := GLOBAL.BLOCK.COBBLESTONE
@onready var sprite := %Sprite
@onready var breaking_sprite := %AnimatedSprite
@onready var player := get_parent().get_node("Player")
@onready var DroppedObjectScene := preload("res://scenes/dropped_object.tscn")

var can_mine := false
var is_mining := false

const TILE_SIZE := 96
const MAP_SIZE_X := TILE_SIZE * 100


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
	player.mining_toggled.emit(false)
	
	var grid_x = int(round((position.x + MAP_SIZE_X / 2.0) / TILE_SIZE))
	var grid_y = int(round(position.y / TILE_SIZE))
	if grid_y >= 0 && grid_y < STATE.map.size() && grid_x >= 0 && grid_x < STATE.map[grid_y].size():
		STATE.map[grid_y][grid_x] = null
	
	var dropped_block = DroppedObjectScene.instantiate()
	dropped_block.object = GLOBAL.blocks[block]["breaking_result"]
	
	if "breaking_result_type" in GLOBAL.blocks[block]:
		dropped_block.type = GLOBAL.OBJECT.ITEM
	else:
		dropped_block.type = GLOBAL.OBJECT.BLOCK
	
	dropped_block.position = position
	get_parent().add_child(dropped_block)
	
	var tree = get_tree()
	for i in range(3):
		await tree.physics_frame
	queue_free()
