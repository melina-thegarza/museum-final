extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var file_path = "res://scenes/%s.tscn"
	file_path = file_path % Global.selected_object.name
	var object = load(file_path).instantiate()
	add_child(object)
	
	var new_camera = Camera2D.new()
	new_camera.zoom = Vector2(8, 8)
	object.add_child(new_camera)
	
	
	#add camera to node -> remove camera2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
