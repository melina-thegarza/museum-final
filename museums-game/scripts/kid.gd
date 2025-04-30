extends CharacterBody2D


var run_speed = 25
var player = null

func _ready():
	player = get_parent().get_node("active-buddha")

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	var moving =false
	if player:
		velocity = position.direction_to(player.position) * run_speed
		moving = true
	move_and_slide()
	update_animation(velocity, moving) # Call a function to update the animation

func update_animation(current_velocity: Vector2, is_moving: bool) -> void:
	

	var animation_to_play = "idle_front" # Default idle animation

	if is_moving:
		if abs(current_velocity.x) > abs(current_velocity.y):
			# Moving horizontally
			if current_velocity.x > 0:
				animation_to_play = "walk_side" # Assuming "walk_side" faces right
				$AnimatedSprite2D.flip_h = false # Ensure not flipped
			else:
				animation_to_play = "walk_side"
				$AnimatedSprite2D.flip_h = true # Flip for left movement
		else:
			# Moving vertically
			if current_velocity.y > 0:
				animation_to_play = "walk_front"
			else:
				animation_to_play = "walk_back"
	else:
		# Not moving, play idle animation
		if abs(current_velocity.x) > abs(current_velocity.y):
			# Last horizontal direction
			if current_velocity.x > 0:
				animation_to_play = "idle_side"
				$AnimatedSprite2D.flip_h = false
			else:
				animation_to_play = "idle_side"
				$AnimatedSprite2D.flip_h = true
		else:
			# Last vertical direction (or default to front)
			if current_velocity.y > 0:
				animation_to_play = "idle_front"
			else:
				animation_to_play = "idle_back"
	if $AnimatedSprite2D.animation != animation_to_play:
		$AnimatedSprite2D.play(animation_to_play)

func _is_kid():
	pass
