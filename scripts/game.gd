extends Node2D

signal inventory_toggled(is_toggled: bool)
signal update_active_object

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
	var ao = STATE.active_object
	if Input.is_action_just_pressed("eat") && STATE.hunger < 6 && ao.object == GLOBAL.ITEM.APPLE && ao.quantity > 0:
		STATE.hunger = min(STATE.hunger + 2, 6)
		STATE.active_object.quantity -= 1
		update_slot_state()
	
	if Input.is_action_just_pressed("place_block") && ao.type == GLOBAL.OBJECT.BLOCK && ao.quantity > 0:
		
		var mouse_pos = get_global_mouse_position()
		var grid_x = int(round((mouse_pos.x + MAP_SIZE_X / 2.0) / TILE_SIZE))
		var grid_y = int(round(mouse_pos.y / TILE_SIZE))
		
		if is_valid_placement_position(grid_x, grid_y):
			STATE.active_object.quantity -= 1
			place_block_at_grid(grid_x, grid_y, ao.object)
			update_slot_state()


func is_valid_placement_position(grid_x: int, grid_y: int) -> bool:
	# checks for out of bounds, row & column existing
	if grid_x < 0 || grid_x > 100 || grid_y < 0:
		return false
	
	while STATE.map.size() <= grid_y:
		STATE.map.append([])
	
	while STATE.map[grid_y].size() <= grid_x:
		STATE.map[grid_y].append(null)
	
	return STATE.map[grid_y][grid_x] == null


func place_block_at_grid(grid_x: int, grid_y: int, block_type: GLOBAL.BLOCK) -> void:
	STATE.map[grid_y][grid_x] = block_type
	
	var block_instance = BlockScene.instantiate()
	block_instance.block = block_type
	block_instance.position = Vector2(grid_x * TILE_SIZE - MAP_SIZE_X / 2.0, grid_y * TILE_SIZE)
	add_child(block_instance)


func update_slot_state() -> void:
	STATE.inventory[0][STATE.current_active_slot] = STATE.active_object.duplicate()
		
	if STATE.active_object.quantity <= 0:
		STATE.active_object = {
			"object": null,
			"type": null,
			"quantity": 0,
		}
		STATE.inventory[0][STATE.current_active_slot] = {
			"object": null,
			"type": null,
			"quantity": 0,
		}
		update_active_object.emit()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_inventory"):
		inventory_open = !inventory_open
		inventory_toggled.emit(inventory_open)


func _on_hunger_timer_timeout() -> void:
	STATE.hunger -= 0.5
