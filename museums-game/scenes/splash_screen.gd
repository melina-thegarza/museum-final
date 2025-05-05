extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	Global._return_to_main_screen()


func _on_start_button_mouse_entered() -> void:
	$start_button.modulate = Color(1.25,1.25,1.25,1.25)



func _on_start_button_mouse_exited() -> void:
	$start_button.modulate = Color(1,1,1,1)


func _on_instructions_button_mouse_entered() -> void:
	$instructions_button.modulate = Color(1.25,1.25,1.25,1.25)


func _on_instructions_button_mouse_exited() -> void:
	$instructions_button.modulate = Color(1,1,1,1)


func _on_instructions_button_pressed() -> void:
	Global._go_to_instructions_screen()
