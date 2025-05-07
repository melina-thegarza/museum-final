extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_out_of_bounds_body_entered(body: Node2D) -> void:
	Global._stage_loss_timeline(3)


func _on_area_2d_box_1_body_entered(body: Node2D) -> void:
	if body.has_method('_is_scholar'):
		$chat_timer.start()
		$cloud.visible = true
		$cloud/cloud_text.text = "“Devotion to Maitreya, ..., was also widespread during the Northern Wei period. Maitreya is worshipped as a bodhisattva in this cosmic era and as a Buddha in the next.“(Leidy, Denise Patry, et al. 58)"


func _on_chat_timer_timeout() -> void:
	$cloud.visible = false


func _on_area_2d_box_2_body_entered(body: Node2D) -> void:
	if body.has_method('_is_scholar'):
		$chat_timer.start()
		$cloud.visible = true
		$cloud/cloud_text.text = "“The rendering of the Buddha’s physique derives from Indian traditions. Broad, flat figures with clinging drapery are typical of sculpture produced in central India in the fifth century, under Gupta rule”(Leidy, Denise Patry, et al. 57)"
		


func _on_area_2d_box_3_body_entered(body: Node2D) -> void:
	if body.has_method('_is_scholar'):
		$chat_timer.start()
		$cloud.visible = true
		$cloud/cloud_text.text = "“The Buddha standing with outstretched arms on a lotus pedestal, seems to be welcoming worshipers.” (Clark 147)"


func _on_end_of_game_body_entered(body: Node2D) -> void:
	if body.has_method('_is_scholar'):
		$portal.visible = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method('_is_scholar'):
		Global._return_to_buddha_selection()
