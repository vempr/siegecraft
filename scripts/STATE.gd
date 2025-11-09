extends Node

var map := [[], [], [], [], [], [], [], []]
var inventory := []

var health := 4.5
var hunger := 6.0
var active_object = {
	"object": null,
	"type": null,
	"quantity": 0
}
var current_active_slot := 0


func _ready() -> void:
	generate_trees()
	generate_floor()
	reset_inventory()


func generate_trees() -> void:
	var tree_positions := []

	for i in range(100):
		if randf() < 0.1:
			tree_positions.append(i)

	for x in tree_positions:
		var height := randi_range(4, 6)
		var ground_y := 8
		
		for y_offset in range(1, height + 1):
			var row_index = ground_y - y_offset
			
			if row_index < 0:
				break
			
			while map[row_index].size() <= x:
				map[row_index].append(null)
			map[row_index][x] = GLOBAL.BLOCK.WOOD_LOG

		var leaves_bottom := ground_y - height
		for lx in range(x - 1, x + 2):
			if lx < 0 or lx >= 100:
				continue
			for ly in range(leaves_bottom - 2, leaves_bottom + 1):
				if ly < 0:
					continue
				
				while map[ly].size() <= lx:
					map[ly].append(null)
				
				if map[ly][lx] == null:
					map[ly][lx] = GLOBAL.BLOCK.LEAF



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
