extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var file_path = "res://scenes/%s.tscn"
	file_path = file_path % Global.selected_object.name
	var object = load(file_path).instantiate()
	add_child(object)
	
	#var new_camera = Camera2D.new()
	#new_camera.zoom = Vector2(8, 8)
	#object.add_child(new_camera)
	var button = Button.new()
	button.text = "start learning..."
	button.add_theme_font_size_override("font_size", 10)
	button.global_position = Vector2(-20,45)
	object.add_child(button)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
