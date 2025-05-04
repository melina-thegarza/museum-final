extends Node


func _process(delta):
	#collected all stones
	if self.get_child_count() == 0:
		Global.end_of_kid_minigame = true
		Global._won_buddha_minigame()
