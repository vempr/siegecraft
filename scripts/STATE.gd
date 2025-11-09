extends Node

var map := [[], [], [], []]
var inventory := []

var health := 4.5
var hunger := 6.0


func _ready() -> void:
	generate_floor()
	reset_inventory()


func generate_floor() -> void:
	# layer 1
	var grass_arr := []
	for i in range(100):
		grass_arr.append(GLOBAL.BLOCK.GRASS)
	map.append(grass_arr)
	
	# layer 2 - 6
	for j in range(5):
		var arr := []
		for i in range(100):
			arr.append(GLOBAL.BLOCK.DIRT)
		map.append(arr)
	
	# layer 7 - 17
	for j in range(10):
		var arr := []
		for i in range(100):
			if randf() < 0.1:
				var rand_ore := randf()
				if rand_ore < 0.1:
					arr.append(GLOBAL.BLOCK.DIAMOND_ORE)
				elif rand_ore < 0.2:
					arr.append(GLOBAL.BLOCK.GOLD_ORE)
				elif rand_ore < 0.4:
					arr.append(GLOBAL.BLOCK.IRON_ORE)
				else:
					arr.append(GLOBAL.BLOCK.COAL_ORE)
			else:
				arr.append(GLOBAL.BLOCK.STONE)
		map.append(arr)
	
	# layer 18
	var bedrock_arr := []
	for i in range(100):
		bedrock_arr.append(GLOBAL.BLOCK.BEDROCK)
	map.append(bedrock_arr)


func reset_inventory() -> void:
	inventory = []
	
	for i in range(2):
		var arr := []
		for j in range(8):
			arr.append({
				"object": null,
				"type": null,
				"quantity": 0,
			})
		inventory.append(arr)
