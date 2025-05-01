
extends CharacterBody2D
var rng = RandomNumberGenerator.new()
var run_speed = rng.randf_range(20.0, 30.0)
var player = null

func _ready():
	player = get_parent().get_parent().get_node("active-buddha")


func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position) * run_speed
	move_and_slide()
func _has_phone():
	pass
