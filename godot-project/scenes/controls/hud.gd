extends CanvasLayer


func change_time(iSecondsTotal):
	var iMinutes = iSecondsTotal / 60
	var iSeconds = iSecondsTotal % 60
	$MarginContainer/HBoxContainer2/Time.text = str(iMinutes).lpad(2, "0") + ":" + str(iSeconds).lpad(2, "0")
	
func change_level(iLevel):
	$MarginContainer/HBoxContainer/IndicadorNivel.text = str(iLevel)
	
func change_level_progress(iCount, iTotal):
	$MarginContainer/HBoxContainer3/LevelProgress.text = str(iCount) + " / " + str(iTotal)
	
func change_life_indicator(value, max_value, invincible):
	$MarginContainer/HBoxContainer4/LifeProgressBar.value = value
	$MarginContainer/HBoxContainer4/LifeProgressBar.max_value = max_value
	
	if invincible:
		$MarginContainer/HBoxContainer4/LifeProgressBar.modulate = Color('#b7b700')
	else:
		$MarginContainer/HBoxContainer4/LifeProgressBar.modulate = Color('#00b760')
	
func change_plaza_indicator(value, max_value):
	$MarginContainer/HBoxContainer5/PlazaProgressBar.value = value
	$MarginContainer/HBoxContainer5/PlazaProgressBar.max_value = max_value
	

func change(TheGameStats):
	change_level(TheGameStats.level)
	change_level_progress(TheGameStats.experience, TheGameStats.experience_next_level)
	change_life_indicator(TheGameStats.life, TheGameStats.max_life, TheGameStats.invincible)
	change_plaza_indicator(TheGameStats.plaza, TheGameStats.max_plaza)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
