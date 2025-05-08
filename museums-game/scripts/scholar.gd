extends CharacterBody2D

const speed = 200
@export var gravity = 30
@export var jump_force = 405



func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = -jump_force
			$jump_sound.play()
	
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	velocity.x = speed * horizontal_direction
	play_anim(horizontal_direction)
	move_and_slide()
	


func play_anim(movement):
	var anim = $AnimatedSprite2D
	if movement == 1 or movement ==-1:
		anim.play("side_walk")
	elif movement == 0:
		anim.play("side_idle")

func _is_scholar():
	pass
