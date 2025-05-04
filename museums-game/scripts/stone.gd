extends CharacterBody2D
@onready var stone_label = $"../../active-buddha/stone_label"


func _on_area_2d_body_entered(body: Node2D) -> void:
	# add a point
	#add a sound effect
	print(body)
	if body.has_method("_active_buddha"):
		print("collected stone")
		stone_label.add_stone()
		queue_free()
func _is_stone():
	pass
