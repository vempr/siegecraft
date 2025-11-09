extends Node2D

signal inventory_toggled(is_toggled: bool)

@onready var BlockScene := preload("res://scenes/block.tscn")
const TILE_SIZE := 96
const MAP_SIZE_X := TILE_SIZE * 100
var inventory_open := false


func _ready() -> void:
	render_blocks()
	spawn_player()


func render_blocks() -> void:	
	for y in range(len(STATE.map)):
		if len(STATE.map[y]) == 0:
			continue
		
		for x in range(len(STATE.map[y])):
			var block_type = STATE.map[y][x]
			if block_type == null:
				continue
			
			var block_instance = BlockScene.instantiate()
			block_instance.block = block_type
			block_instance.position = Vector2(x * TILE_SIZE - MAP_SIZE_X / 2.0, y * TILE_SIZE)
			add_child(block_instance)


func spawn_player() -> void:
	%Player.position.x = randf() * (MAP_SIZE_X / 2.0)
	if randf() < 0.5:
		%Player.position.x = -%Player.position.x


func _process(_delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_inventory"):
		inventory_open = !inventory_open
		inventory_toggled.emit(inventory_open)


func _on_hunger_timer_timeout() -> void:
	STATE.hunger -= 0.5
