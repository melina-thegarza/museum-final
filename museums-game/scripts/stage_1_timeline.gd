extends Node2D
@onready var tilemap = $TileMap

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$won_panel.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var flag = true
	for child in tilemap.get_children():
		if child.visible == false:
			flag = false
	if flag == true:
		#won game
		_show_win_panel()

func _on_out_of_bounds_body_entered(body: Node2D) -> void:
	Global._stage_loss_timeline(1)

func _show_win_panel():
	$won_panel.visible = true


func _on_exit_btn_pressed() -> void:
	Global._restart_stage_timeline()
