extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$portal.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_finish_minigame_body_entered(body: Node2D) -> void:
	if body.has_method("_is_jumping_buddha"):
		$portal.visible = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("_is_jumping_buddha"):
		Global._restart_stage_timeline()


func _on_out_of_bounds_body_entered(body: Node2D) -> void:
	if body.has_method("_is_jumping_buddha"):
		Global._stage_loss_timeline(2)
		
