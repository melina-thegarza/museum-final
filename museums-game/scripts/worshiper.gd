extends CharacterBody2D

@onready var buddha =  $"../../jumping_buddha"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("_is_jumping_buddha"):
		#send signal to light up buddha's light
		buddha._show_light()
		queue_free()
