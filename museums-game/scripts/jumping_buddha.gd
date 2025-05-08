extends CharacterBody2D

const speed = 200
@export var gravity = 30
@export var jump_force = 500

func _ready():
	$light.visible = false

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			$jump_sound.play()
			velocity.y = -jump_force
	
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	velocity.x = speed * horizontal_direction
	move_and_slide()
	
func _show_light():
	$light_timer.start()
	$collected_sound.play()
	$light.visible = true


func _is_jumping_buddha():
	pass


func _on_light_timer_timeout() -> void:
	$light.visible = false
