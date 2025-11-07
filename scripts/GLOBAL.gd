extends Node

enum BLOCK {
	BEDROCK,
	CHEST,
	COAL_ORE,
	COBBLESTONE,
	CRAFTING_TABLE,
	DEEPSLATE_BRICK,
	DIAMOND_ORE,
	DIRT,
	END_PORTAL_FRAME,
	END_PORTAL_FRAME_EYE,
	END_STONE,
	FURNACE,
	GOLD_BLOCK,
	GOLD_ORE,
	GRASS,
	IRON_ORE,
	LAVA,
	LEAF,
	NETHER_BRICK,
	NETHERRACK,
	OBSIDIAN,
	STONE,
	STONE_BRICK,
	WATER,
	WOOD_LOG,
	WOOD_PLANK,
}

enum ITEM {
	APPLE,
	AXE_DIAMOND,
	AXE_GOLDEN,
	AXE_IRON,
	AXE_STONE,
	AXE_WOODEN,
	BLAZE_POWDER,
	COAL,
	DIAMOND,
	ENDER_EYE,
	ENDER_PEARL,
	GOLD,
	IRON,
	PICKAXE_DIAMOND,
	PICKAXE_GOLDEN,
	PICKAXE_IRON,
	PICKAXE_STONE,
	PICKAXE_WOODEN,
	SHOVEL_DIAMOND,
	SHOVEL_GOLD,
	SHOVEL_IRON,
	SHOVEL_STONE,
	SHOVEL_WOODEN,
	STICK,
	SWORD_DIAMOND,
	SWORD_GOLDEN,
	SWORD_IRON,
	SWORD_STONE,
	SWORD_WOODEN,
}

var blocks
var items


func _ready() -> void:
	blocks = {
		BLOCK.BEDROCK: {
			"as_smelter": false,
			"breaking_result": null,
			"smelting_result": null,
			"mineable": false,
			"recipe": null,
		},
		BLOCK.CHEST: {
			"as_smelter": true,
			"breaking_result": BLOCK.CHEST,
			"smelting_result": null,
			"mineable": true,
			"recipe": [
				[BLOCK.WOOD_PLANK, BLOCK.WOOD_PLANK, BLOCK.WOOD_PLANK],
				[BLOCK.WOOD_PLANK, null, BLOCK.WOOD_PLANK],
				[BLOCK.WOOD_PLANK, BLOCK.WOOD_PLANK, BLOCK.WOOD_PLANK]
			],
		},
		BLOCK.COAL_ORE: {
			"as_smelter": false,
			"breaking_result": BLOCK.COAL_ORE,
			"smelting_result": ITEM.COAL,
			"mineable": true,
			"recipe": null,
		},
		BLOCK.COBBLESTONE: {
			"as_smelter": false,
			"breaking_result": BLOCK.COBBLESTONE,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
		},
		BLOCK.CRAFTING_TABLE: {
			"as_smelter": true,
			"breaking_result": BLOCK.CRAFTING_TABLE,
			"smelting_result": null,
			"mineable": true,
			"recipe": [
				[BLOCK.WOOD_PLANK, BLOCK.WOOD_PLANK],
				[BLOCK.WOOD_PLANK, BLOCK.WOOD_PLANK],
			],
		},
		BLOCK.DEEPSLATE_BRICK: {
			"as_smelter": false,
			"breaking_result": BLOCK.DEEPSLATE_BRICK,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
		},
		BLOCK.DIAMOND_ORE: {
			"as_smelter": false,
			"breaking_result": ITEM.DIAMOND,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
		},
		BLOCK.DIRT: {
			"as_smelter": false,
			"breaking_result": BLOCK.DIRT,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
		},
		BLOCK.END_PORTAL_FRAME: {
			"as_smelter": false,
			"breaking_result": null,
			"smelting_result": null,
			"mineable": false,
			"recipe": null,
		},
		BLOCK.END_PORTAL_FRAME_EYE: {
			"as_smelter": false,
			"breaking_result": null,
			"smelting_result": null,
			"mineable": false,
			"recipe": null,
		},
		BLOCK.END_STONE: {
			"as_smelter": false,
			"breaking_result": BLOCK.END_STONE,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
		},
		BLOCK.FURNACE: {
			"as_smelter": false,
			"breaking_result": BLOCK.FURNACE,
			"smelting_result": null,
			"mineable": false,
			"recipe": [
				[BLOCK.COBBLESTONE, BLOCK.COBBLESTONE, BLOCK.COBBLESTONE],
				[BLOCK.COBBLESTONE, null, BLOCK.COBBLESTONE],
				[BLOCK.COBBLESTONE, BLOCK.COBBLESTONE, BLOCK.COBBLESTONE]
			],
		},
		BLOCK.GOLD_BLOCK: {
			"as_smelter": false,
			"breaking_result": BLOCK.GOLD_BLOCK,
			"smelting_result": null,
			"mineable": true,
			"recipe": [
				[ITEM.GOLD, ITEM.GOLD, ITEM.GOLD],
				[ITEM.GOLD, ITEM.GOLD, ITEM.GOLD],
				[ITEM.GOLD, ITEM.GOLD, ITEM.GOLD]
			],
		},
		BLOCK.GOLD_ORE: {
			"as_smelter": false,
			"breaking_result": BLOCK.GOLD_ORE,
			"smelting_result": ITEM.GOLD,
			"mineable": true,
			"recipe": null,
		},
		BLOCK.GRASS: {
			"as_smelter": false,
			"breaking_result": BLOCK.DIRT,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
		},
		BLOCK.IRON_ORE: {
			"as_smelter": false,
			"breaking_result": BLOCK.IRON_ORE,
			"smelting_result": ITEM.IRON,
			"mineable": true,
			"recipe": null,
		},
		BLOCK.LAVA: {
			"as_smelter": false,
			"breaking_result": null,
			"smelting_result": null,
			"mineable": false,
			"recipe": null,
		},
		BLOCK.LEAF: {
			"as_smelter": false,
			"breaking_result": ITEM.APPLE,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
		},
		BLOCK.NETHER_BRICK: {
			"as_smelter": false,
			"breaking_result": BLOCK.NETHER_BRICK,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
		},
		BLOCK.NETHERRACK: {
			"as_smelter": false,
			"breaking_result": BLOCK.NETHERRACK,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
		},
		BLOCK.OBSIDIAN: {
			"as_smelter": false,
			"breaking_result": null,
			"smelting_result": null,
			"mineable": false,
			"recipe": null,
		},
		BLOCK.STONE: {
			"as_smelter": false,
			"breaking_result": BLOCK.COBBLESTONE,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
		},
		BLOCK.STONE_BRICK: {
			"as_smelter": false,
			"breaking_result": null,
			"smelting_result": null,
			"mineable": false,
			"recipe": null,
		},
		BLOCK.WATER: {
			"as_smelter": false,
			"breaking_result": null,
			"smelting_result": null,
			"mineable": false,
			"recipe": null,
		},
		BLOCK.WOOD_LOG: {
			"as_smelter": false,
			"breaking_result": BLOCK.WOOD_LOG,
			"smelting_result": ITEM.COAL,
			"mineable": true,
			"recipe": null,
		},
		BLOCK.WOOD_PLANK: {
			"as_smelter": false,
			"breaking_result": BLOCK.WOOD_PLANK,
			"smelting_result": null,
			"mineable": true,
			"recipe": [[BLOCK.WOOD_LOG]],
		},
	}
	
	items = {
		ITEM.APPLE: {
			"as_smelter": false,
			"recipe": null
		},
		ITEM.AXE_DIAMOND: {
			"as_smelter": false,
			"recipe": [
				[null, ITEM.DIAMOND, ITEM.DIAMOND],
				[null, ITEM.STICK, ITEM.DIAMOND],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.AXE_GOLDEN: {
			"as_smelter": false,
			"recipe": [
				[null, ITEM.GOLD, ITEM.GOLD],
				[null, ITEM.STICK, ITEM.GOLD],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.AXE_IRON: {
			"as_smelter": false,
			"recipe": [
				[null, ITEM.IRON, ITEM.IRON],
				[null, ITEM.STICK, ITEM.IRON],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.AXE_STONE: {
			"as_smelter": false,
			"recipe": [
				[null, BLOCK.COBBLESTONE, BLOCK.COBBLESTONE],
				[null, ITEM.STICK, BLOCK.COBBLESTONE],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.AXE_WOODEN: {
			"as_smelter": true,
			"recipe": [
				[null, BLOCK.WOOD_PLANK, BLOCK.WOOD_PLANK],
				[null, ITEM.STICK, BLOCK.WOOD_PLANK],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.BLAZE_POWDER: {
			"as_smelter": true,
			"recipe": null
		},
		ITEM.COAL: {
			"as_smelter": true,
			"recipe": null
		},
		ITEM.DIAMOND: {
			"as_smelter": false,
			"recipe": null
		},
		ITEM.ENDER_EYE: {
			"as_smelter": false,
			"recipe": [[ITEM.ENDER_PEARL, ITEM.BLAZE_POWDER]]
		},
		ITEM.ENDER_PEARL: {
			"as_smelter": false,
			"recipe": null
		},
		ITEM.GOLD: {
			"as_smelter": false,
			"recipe": null
		},
		ITEM.IRON: {
			"as_smelter": false,
			"recipe": null
		},
		ITEM.PICKAXE_DIAMOND: {
			"as_smelter": false,
			"recipe": [
				[ITEM.DIAMOND, ITEM.DIAMOND, ITEM.DIAMOND],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.PICKAXE_GOLDEN: {
			"as_smelter": false,
			"recipe": [
				[ITEM.GOLD, ITEM.GOLD, ITEM.GOLD],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.PICKAXE_IRON: {
			"as_smelter": false,
			"recipe": [
				[ITEM.IRON, ITEM.IRON, ITEM.IRON],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.PICKAXE_STONE: {
			"as_smelter": false,
			"recipe": [
				[BLOCK.COBBLESTONE, BLOCK.COBBLESTONE, BLOCK.COBBLESTONE],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.PICKAXE_WOODEN: {
			"as_smelter": true,
			"recipe": [
				[BLOCK.WOOD_PLANK, BLOCK.WOOD_PLANK, BLOCK.WOOD_PLANK],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.SHOVEL_DIAMOND: {
			"as_smelter": false,
			"recipe": [
				[null, ITEM.DIAMOND, null],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.SHOVEL_GOLD: {
			"as_smelter": false,
			"recipe": [
				[null, ITEM.GOLD, null],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.SHOVEL_IRON: {
			"as_smelter": false,
			"recipe": [
				[null, ITEM.IRON, null],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.SHOVEL_STONE: {
			"as_smelter": false,
			"recipe": [
				[null, BLOCK.COBBLESTONE, null],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.SHOVEL_WOODEN: {
			"as_smelter": true,
			"recipe": [
				[null, BLOCK.WOOD_PLANK, null],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.STICK: {
			"as_smelter": true,
			"recipe": [[BLOCK.WOOD_PLANK], [BLOCK.WOOD_PLANK]]
		},
		ITEM.SWORD_DIAMOND: {
			"as_smelter": false,
			"recipe": [
				[null, ITEM.DIAMOND, null],
				[null, ITEM.DIAMOND, null],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.SWORD_GOLDEN: {
			"as_smelter": false,
			"recipe": [
				[null, ITEM.GOLD, null],
				[null, ITEM.GOLD, null],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.SWORD_IRON: {
			"as_smelter": false,
			"recipe": [
				[null, ITEM.IRON, null],
				[null, ITEM.IRON, null],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.SWORD_STONE: {
			"as_smelter": false,
			"recipe": [
				[null, BLOCK.COBBLESTONE, null],
				[null, BLOCK.COBBLESTONE, null],
				[null, ITEM.STICK, null],
			]
		},
		ITEM.SWORD_WOODEN: {
			"as_smelter": true,
			"recipe": [
				[null, BLOCK.WOOD_PLANK, null],
				[null, BLOCK.WOOD_PLANK, null],
				[null, ITEM.STICK, null],
			]
		},
	}
