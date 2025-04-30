extends CharacterBody2D

@onready var healthbar = $aura_bar
const SPEED = 300.0
var life = 100

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
