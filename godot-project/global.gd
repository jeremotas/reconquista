extends Node

var settings = {
	"game": {
		"enemy_goal": 12,
		"player_max_life": 10,
		"min_player_life_after_level_up": 0,
		"initial_conditions": {
			"units_arrived": 8,
			"life": 4,
			"malon": {
				"granadero": 2,
				"correntino": 2
			},
			"level": 5,
			"time": 88
		}
	},
	"patricios": {
		"granadero": {
			"life": 10,
			"min_damage_given": 4,
			"max_damage_given": 4,
			"max_speed": 200,
			"bullet_speed": 150,
			"cooldown_attack_time": 1
		},
		"correntino": {
			"life": 3,
			"min_damage_given": 8,
			"max_damage_given": 14,
			"max_speed": 50,
			"bullet_speed": 500,
			"cooldown_attack_time": 5
		}
	},
	"ingleses": {
		"soldado": {
			"life": 8,
			"min_damage_given": 1,
			"max_damage_given": 4,
			"max_speed": 15,
			"bullet_speed": 150,
			"cooldown_attack_time": 1,
			"experience_given": 2
		}
	},
	"enemy_spawn_strategy":[
		{
			"min_time": 0,
			"spawn1": {"unit_type": "ingles", "seconds": 10, "probability": 100},
			"spawn2": {"unit_type": "ingles", "seconds": 7, "probability": 100},
			"spawn3": {"unit_type": "ingles", "seconds": 10, "probability": 100},
			"spawn4": {"unit_type": "ingles", "seconds": 7, "probability": 100},
			"spawn5": {"unit_type": "ingles", "seconds": 10, "probability": 100},
		},
		{
			"min_time": 20,
			"spawn1": {"unit_type": "ingles", "seconds": 4, "probability": 50},
			"spawn2": {"unit_type": "ingles", "seconds": 8, "probability": 90},
			"spawn3": {"unit_type": "ingles", "seconds": 8, "probability": 90},
			"spawn4": {"unit_type": "ingles", "seconds": 8, "probability": 90},
			"spawn5": {"unit_type": "ingles", "seconds": 4, "probability": 50},
		}
	]
}
