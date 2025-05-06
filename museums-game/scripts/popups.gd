extends Control


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func ItemPopup(slot: Rect2i, item):
	var mouse_pos = get_viewport().get_mouse_position()
	var correction
	
	if mouse_pos.x <= get_viewport_rect().size.x/2:
		correction = Vector2i(slot.size.x, 0)
	else:
		correction = -Vector2i(%ItemPopup.size.x, 0)
	%ItemPopup.popup(Rect2i(slot.position+correction, %ItemPopup.size))

func HideItemPopup():
	%ItemPopup.hide()
