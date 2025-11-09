extends Node

enum OBJECT { BLOCK, ITEM }

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

var block_textures := {
	BLOCK.BEDROCK: "res://assets/aseprite/blocks/bedrock.png",
	BLOCK.CHEST: "res://assets/aseprite/blocks/chest.png",
	BLOCK.COAL_ORE: "res://assets/aseprite/blocks/coal-ore.png",
	BLOCK.COBBLESTONE: "res://assets/aseprite/blocks/cobblestone.png",
	BLOCK.CRAFTING_TABLE: "res://assets/aseprite/blocks/crafting-table.png",
	BLOCK.DEEPSLATE_BRICK: "res://assets/aseprite/blocks/deepslate-brick.png",
	BLOCK.DIAMOND_ORE: "res://assets/aseprite/blocks/diamond-ore.png",
	BLOCK.DIRT: "res://assets/aseprite/blocks/dirt.png",
	BLOCK.END_PORTAL_FRAME: "res://assets/aseprite/blocks/end-portal-frame.png",
	BLOCK.END_PORTAL_FRAME_EYE: "res://assets/aseprite/blocks/end-portal-frame-eye.png",
	BLOCK.END_STONE: "res://assets/aseprite/blocks/end-stone.png",
	BLOCK.FURNACE: "res://assets/aseprite/blocks/furnace.png",
	BLOCK.GOLD_BLOCK: "res://assets/aseprite/blocks/gold-block.png",
	BLOCK.GOLD_ORE: "res://assets/aseprite/blocks/gold-ore.png",
	BLOCK.GRASS: "res://assets/aseprite/blocks/grass.png",
	BLOCK.IRON_ORE: "res://assets/aseprite/blocks/iron-ore.png",
	BLOCK.LAVA: "res://assets/aseprite/blocks/lava.png",
	BLOCK.LEAF: "res://assets/aseprite/blocks/leaf.png",
	BLOCK.NETHER_BRICK: "res://assets/aseprite/blocks/nether-brick.png",
	BLOCK.NETHERRACK: "res://assets/aseprite/blocks/netherrack.png",
	BLOCK.OBSIDIAN: "res://assets/aseprite/blocks/obsidian.png",
	BLOCK.STONE_BRICK: "res://assets/aseprite/blocks/stone-brick.png",
	BLOCK.STONE: "res://assets/aseprite/blocks/stone.png",
	BLOCK.WATER: "res://assets/aseprite/blocks/water.png",
	BLOCK.WOOD_LOG: "res://assets/aseprite/blocks/wood-log.png",
	BLOCK.WOOD_PLANK: "res://assets/aseprite/blocks/wood-plank.png",
}

var item_textures := {
	ITEM.APPLE: "res://assets/aseprite/items/apple.png",
	ITEM.AXE_DIAMOND: "res://assets/aseprite/items/axe-diamond.png",
	ITEM.AXE_GOLDEN: "res://assets/aseprite/items/axe-golden.png",
	ITEM.AXE_IRON: "res://assets/aseprite/items/axe-iron.png",
	ITEM.AXE_STONE: "res://assets/aseprite/items/axe-stone.png",
	ITEM.AXE_WOODEN: "res://assets/aseprite/items/axe-wooden.png",
	ITEM.BLAZE_POWDER: "res://assets/aseprite/items/blaze-powder.png",
	ITEM.COAL: "res://assets/aseprite/items/coal.png",
	ITEM.DIAMOND: "res://assets/aseprite/items/diamond.png",
	ITEM.ENDER_EYE: "res://assets/aseprite/items/ender-eye.png",
	ITEM.ENDER_PEARL: "res://assets/aseprite/items/ender-pearl.png",
	ITEM.GOLD: "res://assets/aseprite/items/gold.png",
	ITEM.IRON: "res://assets/aseprite/items/iron.png",
	ITEM.PICKAXE_DIAMOND: "res://assets/aseprite/items/pickaxe-diamond.png",
	ITEM.PICKAXE_GOLDEN: "res://assets/aseprite/items/pickaxe-golden.png",
	ITEM.PICKAXE_IRON: "res://assets/aseprite/items/pickaxe-iron.png",
	ITEM.PICKAXE_STONE: "res://assets/aseprite/items/pickaxe-stone.png",
	ITEM.PICKAXE_WOODEN: "res://assets/aseprite/items/pickaxe-wooden.png",
	ITEM.SHOVEL_DIAMOND: "res://assets/aseprite/items/shovel-diamond.png",
	ITEM.SHOVEL_GOLD: "res://assets/aseprite/items/shovel-gold.png",
	ITEM.SHOVEL_IRON: "res://assets/aseprite/items/shovel-iron.png",
	ITEM.SHOVEL_STONE: "res://assets/aseprite/items/shovel-stone.png",
	ITEM.SHOVEL_WOODEN: "res://assets/aseprite/items/shovel-wooden.png",
	ITEM.STICK: "res://assets/aseprite/items/stick.png",
	ITEM.SWORD_DIAMOND: "res://assets/aseprite/items/sword-diamond.png",
	ITEM.SWORD_GOLDEN: "res://assets/aseprite/items/sword-golden.png",
	ITEM.SWORD_IRON: "res://assets/aseprite/items/sword-iron.png",
	ITEM.SWORD_STONE: "res://assets/aseprite/items/sword-stone.png",
	ITEM.SWORD_WOODEN: "res://assets/aseprite/items/sword-wooden.png",
}

enum BREAK_DIFFICULTY { EASY, MEDIUM, HARD }
enum BREAK_TOOL { PICKAXE, AXE, SHOVEL }

var blocks
var items


func _ready() -> void:
	blocks = {
		BLOCK.BEDROCK: {
			"as_smelter": false,
			"breaking_result": BLOCK.BEDROCK,
			"smelting_result": null,
			"mineable": false,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.PICKAXE
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
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.AXE
		},
		BLOCK.COAL_ORE: {
			"as_smelter": false,
			"breaking_result": BLOCK.COAL_ORE,
			"smelting_result": ITEM.COAL,
			"mineable": true,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.EASY,
			"break_tool": BREAK_TOOL.PICKAXE
		},
		BLOCK.COBBLESTONE: {
			"as_smelter": false,
			"breaking_result": BLOCK.COBBLESTONE,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.EASY,
			"break_tool": BREAK_TOOL.PICKAXE
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
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.AXE
		},
		BLOCK.DEEPSLATE_BRICK: {
			"as_smelter": false,
			"breaking_result": BLOCK.DEEPSLATE_BRICK,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.PICKAXE
		},
		BLOCK.DIAMOND_ORE: {
			"as_smelter": false,
			"breaking_result": ITEM.DIAMOND,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.HARD,
			"break_tool": BREAK_TOOL.PICKAXE,
			"breaking_result_type": OBJECT.ITEM,
		},
		BLOCK.DIRT: {
			"as_smelter": false,
			"breaking_result": BLOCK.DIRT,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.EASY,
			"break_tool": BREAK_TOOL.SHOVEL
		},
		BLOCK.END_PORTAL_FRAME: {
			"as_smelter": false,
			"breaking_result": null,
			"smelting_result": null,
			"mineable": false,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.PICKAXE
		},
		BLOCK.END_PORTAL_FRAME_EYE: {
			"as_smelter": false,
			"breaking_result": null,
			"smelting_result": null,
			"mineable": false,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.PICKAXE
		},
		BLOCK.END_STONE: {
			"as_smelter": false,
			"breaking_result": BLOCK.END_STONE,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.PICKAXE
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
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.PICKAXE
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
			"break_difficulty": BREAK_DIFFICULTY.HARD,
			"break_tool": BREAK_TOOL.PICKAXE
		},
		BLOCK.GOLD_ORE: {
			"as_smelter": false,
			"breaking_result": BLOCK.GOLD_ORE,
			"smelting_result": ITEM.GOLD,
			"mineable": true,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.PICKAXE
		},
		BLOCK.GRASS: {
			"as_smelter": false,
			"breaking_result": BLOCK.DIRT,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.EASY,
			"break_tool": BREAK_TOOL.SHOVEL
		},
		BLOCK.IRON_ORE: {
			"as_smelter": false,
			"breaking_result": BLOCK.IRON_ORE,
			"smelting_result": ITEM.IRON,
			"mineable": true,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.PICKAXE
		},
		BLOCK.LAVA: {
			"as_smelter": false,
			"breaking_result": null,
			"smelting_result": null,
			"mineable": false,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.PICKAXE
		},
		BLOCK.LEAF: {
			"as_smelter": false,
			"breaking_result": ITEM.APPLE,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.EASY,
			"break_tool": BREAK_TOOL.SHOVEL,
			"breaking_result_type": OBJECT.ITEM,
		},
		BLOCK.NETHER_BRICK: {
			"as_smelter": false,
			"breaking_result": BLOCK.NETHER_BRICK,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.PICKAXE
		},
		BLOCK.NETHERRACK: {
			"as_smelter": false,
			"breaking_result": BLOCK.NETHERRACK,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.PICKAXE
		},
		BLOCK.OBSIDIAN: {
			"as_smelter": false,
			"breaking_result": null,
			"smelting_result": null,
			"mineable": false,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.PICKAXE
		},
		BLOCK.STONE: {
			"as_smelter": false,
			"breaking_result": BLOCK.COBBLESTONE,
			"smelting_result": null,
			"mineable": true,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.EASY,
			"break_tool": BREAK_TOOL.PICKAXE
		},
		BLOCK.STONE_BRICK: {
			"as_smelter": false,
			"breaking_result": null,
			"smelting_result": null,
			"mineable": false,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.PICKAXE
		},
		BLOCK.WATER: {
			"as_smelter": false,
			"breaking_result": null,
			"smelting_result": null,
			"mineable": false,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.MEDIUM,
			"break_tool": BREAK_TOOL.PICKAXE
		},
		BLOCK.WOOD_LOG: {
			"as_smelter": false,
			"breaking_result": BLOCK.WOOD_LOG,
			"smelting_result": ITEM.COAL,
			"mineable": true,
			"recipe": null,
			"break_difficulty": BREAK_DIFFICULTY.EASY,
			"break_tool": BREAK_TOOL.AXE
		},
		BLOCK.WOOD_PLANK: {
			"as_smelter": false,
			"breaking_result": BLOCK.WOOD_PLANK,
			"smelting_result": null,
			"mineable": true,
			"recipe": [[BLOCK.WOOD_LOG]],
			"break_difficulty": BREAK_DIFFICULTY.EASY,
			"break_tool": BREAK_TOOL.AXE
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
			],
			"break_tool": BREAK_TOOL.AXE,
		},
		ITEM.AXE_GOLDEN: {
			"as_smelter": false,
			"recipe": [
				[null, ITEM.GOLD, ITEM.GOLD],
				[null, ITEM.STICK, ITEM.GOLD],
				[null, ITEM.STICK, null],
			],
			"break_tool": BREAK_TOOL.AXE,
		},
		ITEM.AXE_IRON: {
			"as_smelter": false,
			"recipe": [
				[null, ITEM.IRON, ITEM.IRON],
				[null, ITEM.STICK, ITEM.IRON],
				[null, ITEM.STICK, null],
			],
			"break_tool": BREAK_TOOL.AXE,
		},
		ITEM.AXE_STONE: {
			"as_smelter": false,
			"recipe": [
				[null, BLOCK.COBBLESTONE, BLOCK.COBBLESTONE],
				[null, ITEM.STICK, BLOCK.COBBLESTONE],
				[null, ITEM.STICK, null],
			],
			"break_tool": BREAK_TOOL.AXE,
		},
		ITEM.AXE_WOODEN: {
			"as_smelter": true,
			"recipe": [
				[null, BLOCK.WOOD_PLANK, BLOCK.WOOD_PLANK],
				[null, ITEM.STICK, BLOCK.WOOD_PLANK],
				[null, ITEM.STICK, null],
			],
			"break_tool": BREAK_TOOL.AXE,
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
			],
			"break_tool": BREAK_TOOL.PICKAXE,
		},
		ITEM.PICKAXE_GOLDEN: {
			"as_smelter": false,
			"recipe": [
				[ITEM.GOLD, ITEM.GOLD, ITEM.GOLD],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			],
			"break_tool": BREAK_TOOL.PICKAXE,
		},
		ITEM.PICKAXE_IRON: {
			"as_smelter": false,
			"recipe": [
				[ITEM.IRON, ITEM.IRON, ITEM.IRON],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			],
			"break_tool": BREAK_TOOL.PICKAXE,
		},
		ITEM.PICKAXE_STONE: {
			"as_smelter": false,
			"recipe": [
				[BLOCK.COBBLESTONE, BLOCK.COBBLESTONE, BLOCK.COBBLESTONE],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			],
			"break_tool": BREAK_TOOL.PICKAXE,
		},
		ITEM.PICKAXE_WOODEN: {
			"as_smelter": true,
			"recipe": [
				[BLOCK.WOOD_PLANK, BLOCK.WOOD_PLANK, BLOCK.WOOD_PLANK],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			],
			"break_tool": BREAK_TOOL.PICKAXE,
		},
		ITEM.SHOVEL_DIAMOND: {
			"as_smelter": false,
			"recipe": [
				[null, ITEM.DIAMOND, null],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			],
			"break_tool": BREAK_TOOL.SHOVEL,
		},
		ITEM.SHOVEL_GOLD: {
			"as_smelter": false,
			"recipe": [
				[null, ITEM.GOLD, null],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			],
			"break_tool": BREAK_TOOL.SHOVEL,
		},
		ITEM.SHOVEL_IRON: {
			"as_smelter": false,
			"recipe": [
				[null, ITEM.IRON, null],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			],
			"break_tool": BREAK_TOOL.SHOVEL,
		},
		ITEM.SHOVEL_STONE: {
			"as_smelter": false,
			"recipe": [
				[null, BLOCK.COBBLESTONE, null],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			],
			"break_tool": BREAK_TOOL.SHOVEL,
		},
		ITEM.SHOVEL_WOODEN: {
			"as_smelter": true,
			"recipe": [
				[null, BLOCK.WOOD_PLANK, null],
				[null, ITEM.STICK, null],
				[null, ITEM.STICK, null],
			],
			"break_tool": BREAK_TOOL.SHOVEL,
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
