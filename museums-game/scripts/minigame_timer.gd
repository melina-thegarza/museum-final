extends Node2D

@onready var label = $Label
@onready var timer = $Timer


func _ready() -> void:
	timer.start()

func time_left_to_live():
	var time_left = timer.time_left
	var minute = floor(time_left/60)
	var second  = int(time_left)%60
	return [minute, second]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "%02d:%02d" % time_left_to_live()


func _on_timer_timeout() -> void:
	print("end of game")
	print("we won")
	#switch scenes
	Global.end_of_kid_minigame = true
	Global._won_buddha_minigame()
