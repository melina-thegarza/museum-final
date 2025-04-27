extends CharacterBody2D
@onready var buddha = $"."
var display = false
var player = null


func _physics_process(delta: float) -> void:
	var buddha_button = $buddha_button
	if display:
		buddha_button.visible = true
	else:
		buddha_button.visible = false


func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	display = true

func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	display = false


func _on_buddha_button_pressed() -> void:
	Global._add_a_scene_manually(buddha)
