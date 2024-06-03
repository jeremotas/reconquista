extends CanvasLayer
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/HBoxContainer/GranaderoButtonCard.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func prepare_buttons(experience):
	$MarginContainer/HBoxContainer/GranaderoButtonCard.visible = false
	$MarginContainer/HBoxContainer/MorenoButtonCard.visible = false
	$MarginContainer/HBoxContainer/CorrentinoButtonCard.visible = false
	$MarginContainer/HBoxContainer/MoreLifeButtonCard.visible = false
	$MarginContainer/HBoxContainer/HusaresInfernalesButtonCard.visible = false
	$MarginContainer/HBoxContainer/BarrileteCosmicoButtonCard.visible = false
	
	# Elijo 3 botones al azar
	var aButtons = [
		$MarginContainer/HBoxContainer/GranaderoButtonCard,
		$MarginContainer/HBoxContainer/MorenoButtonCard,
		$MarginContainer/HBoxContainer/CorrentinoButtonCard,
		$MarginContainer/HBoxContainer/MoreLifeButtonCard,
		$MarginContainer/HBoxContainer/HusaresInfernalesButtonCard,
		$MarginContainer/HBoxContainer/BarrileteCosmicoButtonCard
	]
	aButtons.shuffle()
	aButtons[0].visible = true
	aButtons[1].visible = true
	aButtons[2].visible = true
	aButtons[0].grab_focus.call_deferred()
	
	pass


#func _on_granadero_button_pressed():
#	get_parent().decision_time_end("granadero")


#func _on_correntino_button_pressed():
#	get_parent().decision_time_end("correntino")


#func _on_more_life_button_pressed():
#	get_parent().decision_time_end("upgrade_life")


func _on_visibility_changed():
	$MarginContainer/HBoxContainer/GranaderoButtonCard.grab_focus()


#func _on_moreno_button_pressed():
#	get_parent().decision_time_end("moreno")


#func _on_husares_infernales_button_pressed():
#	get_parent().decision_time_end("ataque_husares_infernales")


#func _on_barrilete_cosmico_button_pressed():
#	get_parent().decision_time_end("barrilete_cosmico")	


func _on_granadero_button_card_pressed():
	get_parent().decision_time_end("granadero")


func _on_correntino_button_card_pressed():
	get_parent().decision_time_end("correntino")


func _on_moreno_button_card_pressed():
	get_parent().decision_time_end("moreno")


func _on_more_life_button_card_pressed():
	get_parent().decision_time_end("upgrade_life")


func _on_barrilete_cosmico_button_card_pressed():
	get_parent().decision_time_end("barrilete_cosmico")	


func _on_husares_infernales_button_card_pressed():
	get_parent().decision_time_end("ataque_husares_infernales")
