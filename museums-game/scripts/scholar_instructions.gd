extends Node2D
const char = "Scholar"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_btn_pressed() -> void:
	Global._transition_to_buddha_minigame(char)


func _on_play_btn_mouse_entered() -> void:
	$play_btn.modulate = Color(1.25,1.25,1.25, 1.25)



func _on_play_btn_mouse_exited() -> void:
	$play_btn.modulate = Color(1,1,1, 1)
