extends Node2D
@onready var cloud_text = $cloud/cloud_text
var statements = null
var index = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#load statements
	_load_statements()
	
func _display_text():
	cloud_text.text = statements[index%len(statements)]
	index +=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _load_statements():
	var file = "res://buddha_dialog.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	statements = JSON.parse_string(json_as_text)
