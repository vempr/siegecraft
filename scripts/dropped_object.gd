extends RigidBody2D

var object = GLOBAL.BLOCK.DIRT # default object
@export var type: GLOBAL.OBJECT


func _ready() -> void:
	position.x += randi_range(-10, 10)
	sleeping = false
	can_sleep = false
	gravity_scale = 1.0
	
	if type == GLOBAL.OBJECT.BLOCK:
		%Sprite.texture = load(GLOBAL.block_textures[object])
	else:
		%Sprite.texture = load(GLOBAL.item_textures[object])


func _on_pickup_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		pickup_object()
		queue_free()


func pickup_object() -> void:
	var existing_stack_pos = find_object()
	if existing_stack_pos.x < 0:
		var new_slot_pos = find_empty_slot()
		if new_slot_pos.x < 0:
			return
		
		STATE.inventory[new_slot_pos.x][new_slot_pos.y] = {
			"object": object,
			"type": type,
			"quantity": 1,
		}
		if new_slot_pos.x == 0 && new_slot_pos.y == STATE.current_active_slot:
			STATE.active_object = STATE.inventory[0][STATE.current_active_slot].duplicate()
		queue_free()
	else:
		STATE.inventory[existing_stack_pos.x][existing_stack_pos.y]["quantity"] += 1
		if STATE.inventory[existing_stack_pos.x][existing_stack_pos.y]["quantity"] > 64:
			STATE.inventory[existing_stack_pos.x][existing_stack_pos.y]["quantity"] = 64
		
		if existing_stack_pos.x == 0 && existing_stack_pos.y == STATE.current_active_slot:
			STATE.active_object = STATE.inventory[0][STATE.current_active_slot].duplicate()
		
		queue_free()
	
	get_parent().update_active_object.emit()


func find_object() -> Vector2i:
	for i in range(STATE.inventory.size()):
		for j in range(STATE.inventory[i].size()):
			if STATE.inventory[i][j]["object"] == object && STATE.inventory[i][j]["type"] == type:
				return Vector2i(i, j)
	
	return Vector2i(-1, -1)


func find_empty_slot() -> Vector2i:
	for i in range(STATE.inventory.size()):
		for j in range(STATE.inventory[i].size()):
			var slot = STATE.inventory[i][j]
			if slot["object"] == null && slot["type"] == null && slot["quantity"] == 0:
				return Vector2i(i, j)
	
	return Vector2i(-1, -1)
