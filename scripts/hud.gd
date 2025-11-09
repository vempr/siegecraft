extends CanvasLayer

signal active_object_switched

@onready var player := %Player

const TILE_SIZE := 96
const Y_OFFSET := 96 * 18 + 48 # 18 layers from world generation
@onready var hearts := [%Heart1, %Heart2, %Heart3, %Heart4, %Heart5, %Heart6]
@onready var apples := [%Apple1, %Apple2, %Apple3, %Apple4, %Apple5, %Apple6]
@onready var bar_slots := [%BarSlot1, %BarSlot2, %BarSlot3, %BarSlot4, %BarSlot5, %BarSlot6, %BarSlot7, %BarSlot8]
@onready var inventory_slots := [%InventorySlot1, %InventorySlot2, %InventorySlot3, %InventorySlot4, %InventorySlot5, %InventorySlot6, %InventorySlot7, %InventorySlot8, %InventorySlot9, %InventorySlot10, %InventorySlot11, %InventorySlot12, %InventorySlot13, %InventorySlot14, %InventorySlot15, %InventorySlot16]
var v := false


func _ready() -> void:
	toggle_inventory(false)
	reset_hearts()
	reset_apples()
	select_hotbar_slot(0)


func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		for i in range(8):
			if event.keycode == KEY_1 + i:
				select_hotbar_slot(i)
				break


func select_hotbar_slot(slot_index: int) -> void:
	STATE.current_active_slot = slot_index
	
	for i in range(len(bar_slots)):
		if i == slot_index:
			bar_slots[slot_index].trigger_active.emit(true)
			var ao = STATE.inventory[0][slot_index]
			STATE.active_object = {
				"object": ao["object"],
				"type": ao["type"],
				"quantity": ao["quantity"],
			}
			active_object_switched.emit()
		else:
			bar_slots[i].trigger_active.emit(false)


func check_active_slot_update() -> void:
	var current_slot_content = STATE.inventory[0][STATE.current_active_slot]
	
	if current_slot_content.quantity <= 0:
		STATE.active_object = {
			"object": null,
			"type": null,
			"quantity": 0,
		}
		active_object_switched.emit()
	elif STATE.active_object.object != current_slot_content.object || STATE.active_object.type != current_slot_content.type:
		STATE.active_object = {
			"object": current_slot_content["object"],
			"type": current_slot_content["type"],
			"quantity": current_slot_content["quantity"],
		}
		active_object_switched.emit()


func toggle_inventory(isVisible: bool = true) -> void:
	if isVisible:
		%InvOverlay.visible = true
		%Inventory.visible = true
	else:
		%InvOverlay.visible = false
		%Inventory.visible = false


func reset_hearts() -> void:
	for heart in hearts:
		for sprite in heart.get_children():
			sprite.visible = false


func reset_apples() -> void:
	for apple in apples:
		for sprite in apple.get_children():
			sprite.visible = false


func _process(_delta: float) -> void:
	update_coordinates()
	update_health()
	update_hunger()
	update_bar()
	
	if v:
		update_inventory()


func _on_game_inventory_toggled(is_toggled: bool) -> void:
	v = is_toggled
	toggle_inventory(is_toggled)


func update_coordinates() -> void:
	var x = snapped(player.position.x / TILE_SIZE, 0.1)
	var y = snapped((-player.position.y + Y_OFFSET) / TILE_SIZE, 0.1)
	
	%Coordinates.text = "x: " + str(x) + "\n"
	%Coordinates.text += "y: " + str(y)


func update_health() -> void:
	for i in range(len(hearts)):
		var heart = hearts[i]
		var health_left = STATE.health - i
		
		var full_heart_sprite = heart.get_node("Heart")
		var half_heart_sprite = heart.get_node("HeartHalf")
		
		full_heart_sprite.visible = false
		half_heart_sprite.visible = false
		
		if health_left >= 1.0:
			full_heart_sprite.visible = true
		elif health_left >= 0.5:
			full_heart_sprite.visible = false
			half_heart_sprite.visible = true
		else:
			heart.get_node("HeartEmpty").visible = true


func update_hunger() -> void:
	for i in range(len(apples)):
		var apple = apples[i]
		var hunger_left = STATE.hunger - i
		
		var full_apple_sprite = apple.get_node("Apple")
		var half_apple_sprite = apple.get_node("AppleHalf")
		
		full_apple_sprite.visible = false
		half_apple_sprite.visible = false
		
		if hunger_left >= 1.0:
			full_apple_sprite.visible = true
		elif hunger_left >= 0.5:
			full_apple_sprite.visible = false
			half_apple_sprite.visible = true
		else:
			apple.get_node("AppleEmpty").visible = true


func update_bar() -> void:
	for i in range(len(bar_slots)):
		bar_slots[i].properties = STATE.inventory[0][i]
		bar_slots[i].update()
	
	check_active_slot_update()


func update_inventory() -> void:
	for i in range(16):
		var row = int(floor(i / 8))
		var col = i % 8
		inventory_slots[i].properties = STATE.inventory[row][col]
		inventory_slots[i].update()
