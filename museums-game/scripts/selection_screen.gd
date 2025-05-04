extends Control
@onready var scholar = $TextureRect/HBoxContainer/Scholar
@onready var kid = $TextureRect/HBoxContainer/Kid
@onready var start = $start
@onready var exit = $exit
var is_mouse_over = false
var selected = null
var selected_char = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_scholar_mouse_entered() -> void:
	is_mouse_over = true
	selected = scholar
	


func _on_scholar_mouse_exited() -> void:
	is_mouse_over = false
	selected = null
	

func _input(event):
	if is_mouse_over and event is InputEventMouseButton and event.pressed:
		selected_char = selected
		#selected.modulate = Color(.1, 1, 0, 1)
		selected.modulate = Color(1, 1.25, 1, 1)
		if selected == scholar:
			kid.modulate = Color(1,1, 1,1)
		else:
			scholar.modulate = Color(1,1, 1,1)


func _on_kid_mouse_entered() -> void:
	is_mouse_over = true
	selected = kid
	


func _on_kid_mouse_exited() -> void:
	is_mouse_over = false
	selected = null
	


func _on_start_pressed() -> void:
	Global._transition_to_buddha_minigame(selected_char.name)


func _on_start_mouse_entered() -> void:
	start.modulate = Color(1,1.25,1,1)


func _on_start_mouse_exited() -> void:
	start.modulate = Color(1,1,1,1)


func _on_exit_mouse_entered() -> void:
	exit.modulate = Color(1,1.25,1,1)


func _on_exit_mouse_exited() -> void:
	exit.modulate = Color(1,1,1,1)


func _on_exit_pressed() -> void:
	Global._return_to_main_screen()
