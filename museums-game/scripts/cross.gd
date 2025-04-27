extends CharacterBody2D
@onready var cross = $"."
var display = false
var player = null


func _physics_process(delta: float) -> void:
	var cross_button = $cross_button
	if display:
		cross_button.visible = true
	else:
		cross_button.visible = false


func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	display = true

func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	display = false
	

func _on_cross_button_pressed() -> void:
	Global._add_a_scene_manually(cross)
