extends Node;

var strategy = [
		{
			"max_time": 10,
			"max_alive": 5,
			"name": "La avanzada",
			"izquierda_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"izquierda_superior": {"unit_type": "ingles", "seconds": 10, "probability": 0},
			"arriba_izquierda": {"unit_type": "ingles", "seconds": 2, "probability": 10},
			"arriba_centro": {"unit_type": "ingles", "seconds": 2, "probability":40},
			"arriba_derecha": {"unit_type": "ingles", "seconds": 2, "probability": 10},
			"derecha_superior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"derecha_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
		},
		{
			"max_time": 15,
			"max_alive": 0,
			"name": "",
			"izquierda_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"izquierda_superior": {"unit_type": "ingles", "seconds": 10, "probability": 0},
			"arriba_izquierda": {"unit_type": "ingles", "seconds": 2, "probability": 0},
			"arriba_centro": {"unit_type": "ingles", "seconds": 2, "probability":0},
			"arriba_derecha": {"unit_type": "ingles", "seconds": 2, "probability": 0},
			"derecha_superior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"derecha_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
		},
				{
			"max_time": 30,
			"max_alive": 10,
			"name": "El flanqueo",
			"izquierda_inferior": {"unit_type": "ingles", "seconds": 2, "probability": 40},
			"izquierda_superior": {"unit_type": "ingles", "seconds": 2, "probability": 40},
			"arriba_izquierda": {"unit_type": "ingles", "seconds": 10, "probability": 0},
			"arriba_centro": {"unit_type": "ingles", "seconds": 0, "probability":0},
			"arriba_derecha": {"unit_type": "ingles", "seconds": 10, "probability": 0},
			"derecha_superior": {"unit_type": "ingles", "seconds": 2, "probability": 40},
			"derecha_inferior": {"unit_type": "ingles", "seconds": 2, "probability": 40},
		},
		{
			"max_time": 50,
			"max_alive": 0,
			"name": "",
			"izquierda_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"izquierda_superior": {"unit_type": "ingles", "seconds": 10, "probability": 0},
			"arriba_izquierda": {"unit_type": "ingles", "seconds": 2, "probability": 0},
			"arriba_centro": {"unit_type": "ingles", "seconds": 2, "probability":0},
			"arriba_derecha": {"unit_type": "ingles", "seconds": 2, "probability": 0},
			"derecha_superior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"derecha_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
		},
		{
			"max_time": 120,
			"max_alive": 20,
			"name": "El ataque",
			"izquierda_inferior": {"unit_type": "ingles", "seconds": 12, "probability": 0},
			"izquierda_superior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"arriba_izquierda": {"unit_type": "ingles", "seconds": 1, "probability": 40},
			"arriba_centro": {"unit_type": "highlander", "seconds": 10, "probability": 10},
			"arriba_derecha": {"unit_type": "ingles", "seconds": 1, "probability": 40},
			"derecha_superior": {"unit_type": "ingles", "seconds": 8, "probability": 0},
			"derecha_inferior": {"unit_type":"ingles", "seconds": 12, "probability": 0},
		},
		{
			"max_time": 150,
			"max_alive": 0,
			"name": "",
			"izquierda_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"izquierda_superior": {"unit_type": "ingles", "seconds": 10, "probability": 0},
			"arriba_izquierda": {"unit_type": "ingles", "seconds": 2, "probability": 0},
			"arriba_centro": {"unit_type": "ingles", "seconds": 2, "probability":0},
			"arriba_derecha": {"unit_type": "ingles", "seconds": 2, "probability": 0},
			"derecha_superior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"derecha_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
		},
		{
			"max_time": 180,
			"max_alive": 40,
			"name": "El segundo ataque",
			"izquierda_inferior": {"unit_type": "ingles", "seconds": 4, "probability": 100},
			"izquierda_superior": {"unit_type": "ingles", "seconds": 1, "probability": 50},
			"arriba_izquierda": {"unit_type": "ingles", "seconds": 1, "probability": 50},
			"arriba_centro": {"unit_type": "highlander", "seconds": 6, "probability": 10},
			"arriba_derecha": {"unit_type": "ingles", "seconds": 1, "probability": 50},
			"derecha_superior": {"unit_type": "ingles", "seconds": 1, "probability": 50},
			"derecha_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 50},
		},
		{
			"max_time": 220,
			"max_alive": 0,
			"name": "",
			"izquierda_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"izquierda_superior": {"unit_type": "ingles", "seconds": 10, "probability": 0},
			"arriba_izquierda": {"unit_type": "ingles", "seconds": 2, "probability": 0},
			"arriba_centro": {"unit_type": "ingles", "seconds": 2, "probability":0},
			"arriba_derecha": {"unit_type": "ingles", "seconds": 2, "probability": 0},
			"derecha_superior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"derecha_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
		},
		{
			"max_time": 240,
			"max_alive": 60,
			"name": "El ataque feroz",
			"izquierda_inferior": {"unit_type": "green_soldier", "seconds": 3, "probability": 40},
			"izquierda_superior": {"unit_type": "ingles", "seconds": 1, "probability": 40},
			"arriba_izquierda": {"unit_type": "ingles", "seconds": 1, "probability": 40},
			"arriba_centro": {"unit_type": "highlander", "seconds": 2, "probability": 5},
			"arriba_derecha": {"unit_type": "ingles", "seconds": 1, "probability": 20},
			"derecha_superior": {"unit_type": "green_soldier", "seconds": 3, "probability": 20},
			"derecha_inferior": {"unit_type": [{"unit_type":"highlander", "probability": 30}, {"unit_type":"ingles", "probability": 70}], "seconds": 1, "probability": 20},
		},
		{
			"max_time": 270,
			"max_alive": 0,
			"name": "",
			"izquierda_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"izquierda_superior": {"unit_type": "ingles", "seconds": 10, "probability": 0},
			"arriba_izquierda": {"unit_type": "ingles", "seconds": 2, "probability": 0},
			"arriba_centro": {"unit_type": "ingles", "seconds": 2, "probability":0},
			"arriba_derecha": {"unit_type": "ingles", "seconds": 2, "probability": 0},
			"derecha_superior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"derecha_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
		},
		{
			"max_time": 300,
			"max_alive": 20,
			"name": "La estampida mortal",
			"izquierda_inferior": {"unit_type": "highlander", "seconds": 3, "probability": 70},
			"izquierda_superior": {"unit_type": "ingles", "seconds": 3, "probability": 40},
			"arriba_izquierda": {"unit_type": "ingles", "seconds": 4, "probability": 95},
			"arriba_centro": {"unit_type": "highlander", "seconds": 3, "probability": 40},
			"arriba_derecha": {"unit_type": "ingles", "seconds": 3, "probability": 70},
			"derecha_superior": {"unit_type": "ingles", "seconds": 3, "probability": 70},
			"derecha_inferior": {"unit_type": "highlander", "seconds": 3, "probability": 70},
		},
		
		{
			"max_time": 330,
			"max_alive": 0,
			"name": "",
			"izquierda_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"izquierda_superior": {"unit_type": "ingles", "seconds": 10, "probability": 0},
			"arriba_izquierda": {"unit_type": "ingles", "seconds": 2, "probability": 0},
			"arriba_centro": {"unit_type": "ingles", "seconds": 2, "probability":0},
			"arriba_derecha": {"unit_type": "ingles", "seconds": 2, "probability": 0},
			"derecha_superior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
			"derecha_inferior": {"unit_type": "ingles", "seconds": 1, "probability": 0},
		},
		{
			"max_time": 380,
			"max_alive": 50,
			"name": "Atención al flanco derecho",
			"izquierda_inferior": {"unit_type": "highlander", "seconds": 3, "probability": 0},
			"izquierda_superior": {"unit_type": "green_soldier", "seconds": 3, "probability": 40},
			"arriba_izquierda": {"unit_type": "ingles", "seconds": 4, "probability": 0},
			"arriba_centro": {"unit_type": "highlander", "seconds": 3, "probability": 40},
			"arriba_derecha": {"unit_type": "ingles", "seconds": 2, "probability": 70},
			"derecha_superior": {"unit_type": "highlander", "seconds": 2, "probability": 70},
			"derecha_inferior": {"unit_type": "ingles", "seconds": 2, "probability": 70},
		},
		{
			"max_time": 540,
			"max_alive": 100,
			"name": "La última ola",
			"izquierda_inferior": {"unit_type": "ingles", "seconds": 1.5, "probability": 40},
			"izquierda_superior": {"unit_type": "highlander", "seconds": 2, "probability": 30},
			"arriba_izquierda": {"unit_type": "ingles", "seconds": 2, "probability": 40},
			"arriba_centro": {"unit_type": "highlander", "seconds": 2, "probability": 30},
			"arriba_derecha": {"unit_type": "highlander", "seconds": 1.5, "probability": 40},
			"derecha_superior": {"unit_type": "ingles", "seconds": 1.5, "probability": 40},
			"derecha_inferior": {"unit_type": "highlander", "seconds": 1.5, "probability": 40},
		}
	]
