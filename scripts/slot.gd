extends Control

var properties


func _ready() -> void:
	visible = false


func update() -> void:
	if properties.quantity <= 0:
		visible = false
		return
	
	if properties.type == GLOBAL.OBJECT.BLOCK:
		%Sprite.texture = load(GLOBAL.block_textures[properties.object])
	else:
		%Sprite.texture = load(GLOBAL.item_textures[properties.object])
	
	%Quantity.text = str(properties.quantity)
	visible = true
