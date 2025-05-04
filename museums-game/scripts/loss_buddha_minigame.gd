extends Node2D




func _on_exit_button_pressed() -> void:
	Global._return_to_buddha_selection()


func _on_yes_button_pressed() -> void:
	
	Global._transition_to_buddha_minigame("kid_chase")
