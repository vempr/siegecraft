extends Control

signal trigger_active(is_active: bool)

var properties
var can_move := false


func _ready() -> void:
	%Sprite.visible = false
	%Quantity.visible = false


func _process(_delta: float) -> void:
	if Input.is_action_pressed("mine") && can_move:
		position = get_global_mouse_position()


func update() -> void:
	if properties.quantity <= 0:
		%Sprite.visible = false
		%Quantity.visible = false
		properties = {
			"object": null,
			"type": null,
			"quantity": 0,
		}
		return
	
	if properties.type == GLOBAL.OBJECT.BLOCK:
		%Sprite.texture = load(GLOBAL.block_textures[properties.object])
	else:
		%Sprite.texture = load(GLOBAL.item_textures[properties.object])
	
	%Quantity.text = str(properties.quantity)
	%Sprite.visible = true
	%Quantity.visible = true


func _on_trigger_active(is_active: bool) -> void:
	if is_active:
		%Selected.visible = true
	else:
		%Selected.visible = false


func _on_mouse_entered() -> void:
	can_move = true


func _on_mouse_exited() -> void:
	can_move = false
