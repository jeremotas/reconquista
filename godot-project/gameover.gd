extends Node

func _ready():
	$VBoxContainer/Reiniciar.grab_focus()

func _on_reiniciar_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_salir_pressed():
	get_tree().change_scene_to_file("res://inicio.tscn")

