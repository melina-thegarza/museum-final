extends Node2D
@onready var label = $score_label

var score = 0
const img = "[img]res://art/items/mini_stone.png[/img]"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_stone():
	score +=1
	label.text = img +" "+ str(score)
	print(score)
	
	
