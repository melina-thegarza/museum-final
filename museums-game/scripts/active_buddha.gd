extends CharacterBody2D

@onready var healthbar = $aura_bar
@onready var dialog_bubble = $buddha_dialog
@onready var light = $light
const SPEED = 300.0
const INITIAL_LIFE = 100  # Use a constant for the initial life value
var life = INITIAL_LIFE

func _ready() -> void:
	_reset_life()
	dialog_bubble.visible = false
	light.enabled = false
	

func _physics_process(delta: float) -> void:
	healthbar.value = life
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var up_down := Input.get_axis("ui_up", "ui_down")
	if up_down:
		velocity.y = up_down * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.has_method("_is_kid"):
		life -= 20
		print(life)
		dialog_bubble.visible = true
		self.modulate = Color(0.8,0.8,0.8,0.8)
		#light.enabled = true
		dialog_bubble._display_text()
		$display_dialog.start()
	elif body.has_method("_has_phone"):
		life -= 10
		print(life)
		dialog_bubble.visible = true
		#light.enabled = true
		self.modulate = Color(0.8,0.8,0.8,0.8)
		$display_dialog.start()
		dialog_bubble.cloud_text.text = "Stop texting, be respectful!"
	elif body.has_method("_is_stone"):
		light.enabled = true
		$light_timer.start()
	
	if life <=0:
		_lost_minigame()
func _active_buddha():
	pass

func _on_display_dialog_timeout() -> void:
	dialog_bubble.visible = false
	#light.enabled = false
	self.modulate = Color(1,1,1,1)
	
func _lost_minigame():
	Global.end_of_kid_minigame = true
	_reset_life()
	Global._loss_buddha_minigame()

func _reset_life() -> void:
	"""
	Resets the player's life to the initial value.  Call this at the start
	of the minigame or whenever you want to reset the player's health.
	"""
	life = INITIAL_LIFE


func _on_light_timer_timeout() -> void:
	light.enabled = false
