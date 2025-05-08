extends Node2D

var current_stage = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$boxes/mystery_box_level_1/stage_1_label.visible = false
	$boxes/mystery_box_level_2/stage_2_label.visible = false
	$boxes/mystery_box_level_3/stage_3_label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: 
	if Input.is_action_pressed("KEY_ENTER") and current_stage>0:
		Global._go_stage_timeline(current_stage)



func _on_out_of_bounds_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_area_2d_level_2_body_entered(body: Node2D) -> void:
	if body.has_method("_is_scholar"):
		current_stage = 2
		$hit_box_sound.play()
		$boxes/mystery_box_level_2/stage_2_label.visible = true


func _on_area_2d_level_1_body_entered(body: Node2D) -> void:
	if body.has_method("_is_scholar"):
		$hit_box_sound.play()
		current_stage = 1
		$boxes/mystery_box_level_1/stage_1_label.visible = true


func _on_area_2d_level_3_body_entered(body: Node2D) -> void:
	if body.has_method("_is_scholar"):
		current_stage = 3
		$hit_box_sound.play()
		$boxes/mystery_box_level_3/stage_3_label.visible = true


func _on_exit_button_pressed() -> void:
	Global._return_to_buddha_selection()
