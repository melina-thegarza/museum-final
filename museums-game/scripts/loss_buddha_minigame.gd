extends Node2D




func _on_exit_button_pressed() -> void:
	Global._return_to_buddha_selection()


func _on_yes_button_pressed() -> void:
	
	Global._transition_to_buddha_minigame("kid_chase")


func _on_no_button_mouse_entered() -> void:
	$no_button.modulate = Color(1.25,1.25,1.25, 1.25)


func _on_no_button_mouse_exited() -> void:
	$no_button.modulate = Color(1,1,1, 1)


func _on_yes_button_mouse_entered() -> void:
	$yes_button.modulate = Color(1.25,1.25,1.25, 1.25)


func _on_yes_button_mouse_exited() -> void:
	$yes_button.modulate = Color(1,1,1, 1)
