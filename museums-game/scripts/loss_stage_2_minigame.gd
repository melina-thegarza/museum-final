extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_no_button_pressed() -> void:
	Global._restart_stage_timeline()


func _on_yes_button_pressed() -> void:
	Global._go_stage_timeline(2)
