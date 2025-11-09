extends CanvasLayer

@onready var player := %Player

const TILE_SIZE := 96
const Y_OFFSET := 96 * 18 + 48 # 18 layers from world generation
@onready var hearts := [%Heart1, %Heart2, %Heart3, %Heart4, %Heart5, %Heart6]
@onready var apples := [%Apple1, %Apple2, %Apple3, %Apple4, %Apple5, %Apple6]


func _ready() -> void:
	toggle_inventory(false)
	reset_hearts()
	reset_apples()


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


func _on_game_inventory_toggled(is_toggled: bool) -> void:
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
