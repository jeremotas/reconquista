extends CharacterBody2D
class_name Character

@export var faction = ""
@export var max_speed = 200
@export var speed = 0
@export var acceleration = 1200
@export var life = 10
@export var coolDownAttackTime = 3.0
@export var min_damage_given = 1
@export var max_damage_given = 1
@export var unit_type = 'default'
@export var input_accepted = false
@export var attack_block_movement = true

var input_direction
var move_direction
var rng
@onready var animation_tree : AnimationTree = $AnimationTree

var status = {"moving": false, "attacking": false, "hurt": false}



var destination = Vector2()
var movement = Vector2()
var animation_flip = false
var selected = false
var last_position = Vector2.ZERO
var inCoolDownAttack = false
var coolDownTimer = null

var comLabelString = ""
var vMouseInitialPosition = Vector2.ZERO

func add_to_faction(new_faction):
	faction = new_faction
	add_to_group("faccion_" + faction)

func go_to(new_destination, forced = false):
	if selected or forced:
		status.moving = true
		destination = new_destination
		if $SelectionArea:
			$SelectionArea.set_selected(false)
			
			
func get_input():
	var direction = Vector2.ZERO
	if input_accepted:
		direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
		direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))

		if Input.is_action_just_pressed("Click"):
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			vMouseInitialPosition = get_global_mouse_position()
		if Input.is_action_just_released("Click"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			
		if Input.is_action_pressed("Click"):
			var vMousePosition = get_global_mouse_position()
			direction = (vMousePosition - vMouseInitialPosition)
			if direction.distance_to(Vector2.ZERO) < 10:
				direction = Vector2.ZERO
			
			
		
	return direction.normalized()

func takeDamage(min_damage, max_damage):
	var damage = rng.randi_range(min_damage, max_damage)
	if damage > 0:
		communication("HURT (" + str(damage) + ")")
		life = life - damage 
		if life < 0: life = 0	
		status.hurt = true
		
func CombatCalculation(delta):
	if $CombatArea:
		if $CombatArea.has_overlapping_bodies() and $CombatArea.get_overlapping_bodies().size() > 1:
			if not inCoolDownAttack:
				var attacked = false
				status.attacking = false
				for unitInArea in $CombatArea.get_overlapping_bodies():
					if ("faction" in unitInArea) and unitInArea.faction != faction and not attacked:
						inCoolDownAttack = true
						unitInArea.takeDamage(min_damage_given, max_damage_given)
						coolDownTimer.start()
						status.attacking = true
						attacked = true
				
			else:
				var enemiesInArea = 0
				for unitInArea in $CombatArea.get_overlapping_bodies():
					if ("faction" in unitInArea) and unitInArea.faction != faction:
						enemiesInArea += 1
				if enemiesInArea == 0:
					status.attacking = false
		else: 
			status.attacking = false
			
	if status.attacking and attack_block_movement:
		status.moving = false

func AnimationCalculation(delta):
	
	if life == 0:
		animation_tree["parameters/conditions/die"] = true
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/got_hurt"] = false
		animation_tree["parameters/conditions/shooting"] = false
		animation_tree["parameters/conditions/walking"] = false
	elif status.hurt:
		animation_tree["parameters/conditions/die"] = false
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/got_hurt"] = true
		animation_tree["parameters/conditions/shooting"] = false
		animation_tree["parameters/conditions/walking"] = false
	elif status.attacking:
		animation_tree["parameters/conditions/die"] = false
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/got_hurt"] = false
		animation_tree["parameters/conditions/shooting"] = true
		animation_tree["parameters/conditions/walking"] = false
	elif status.moving:
		animation_tree["parameters/conditions/die"] = false
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/got_hurt"] = false
		animation_tree["parameters/conditions/shooting"] = false
		animation_tree["parameters/conditions/walking"] = true
	else:
		animation_tree["parameters/conditions/die"] = false
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/got_hurt"] = false
		animation_tree["parameters/conditions/shooting"] = false
		animation_tree["parameters/conditions/walking"] = false
	
	if velocity.x > 0: 
		animation_flip = false
	elif velocity.x < 0:
		animation_flip = true
		
	#$AnimatedSprite2D.play(animation_selected)
	
	pass
	
func MovementLoop(delta):
	# Gestionamos velocidad
	
	if status.moving == false and not input_accepted:
		speed = 0
	else:
		speed += acceleration * delta
		if speed > max_speed:
			speed = max_speed

	if not input_accepted:
		# Determinamos hacia donde vamos.
		velocity = global_position.direction_to(destination) * speed
		# Calculamos la direccion del movimiento
		move_direction = rad_to_deg(destination.angle_to_point(global_position))
		
		# Resolvemos el movimiento
		if global_position.distance_to(destination) < 5: # Estamos lo suficientemente cerca
			status.moving = false
		if global_position.distance_to(last_position) < 0.2 and status.moving:
			status.moving = false
		elif status.moving:
			last_position = global_position
	else:
		var input = get_input();
		velocity = input * speed
		status.moving = false
		if input != Vector2.ZERO: 
			status.moving = true
	
	var can_move = life > 0 and not status.attacking
	
	if can_move or input_accepted:
		move_and_slide()
	
func StatusCalculation(delta):
	if life == 0:
		status.moving = false
		status.attacking = false
		var deathTimer = Timer.new()
		add_child(deathTimer)
		deathTimer.autostart = true
		deathTimer.wait_time = 1.0
		deathTimer.one_shot = true
		deathTimer.timeout.connect(destroy_character)
		deathTimer.start()

func destroy_character():
	queue_free()

func _on_cool_down_timer_timeout():
	if inCoolDownAttack:
		inCoolDownAttack = false
		status.attacking = false

func init():
	rng = RandomNumberGenerator.new()
	
	coolDownTimer = Timer.new()
	add_child(coolDownTimer)
	coolDownTimer.autostart = true
	coolDownTimer.wait_time = coolDownAttackTime
	coolDownTimer.one_shot = true
	coolDownTimer.timeout.connect(_on_cool_down_timer_timeout)
	pass

func _physics_process(delta):
	MovementLoop(delta)
	
func _process(delta):
	comLabelString = ""
	
	StatusCalculation(delta)
	CombatCalculation(delta)
	ComunicationCalculation(delta)
	AnimationCalculation(delta)
	
func ComunicationCalculation(delta):
	#if (comLabelString != ""):
		#$ComLabel.text = comLabelString
		#$ComLabel.show()
	$LifeLabel.text = str(life)
	$LifeLabel.show()
	
func communication(message):
	comLabelString += message + " " 
	
func _ready():
	init()
