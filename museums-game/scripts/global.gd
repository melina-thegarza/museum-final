extends Node

var player_current_attack = false

var selected_object = null


var object_scene = preload("res://scenes/level_2.tscn").instantiate()
var character_selection_scene = preload("res://scenes/selection_screen.tscn").instantiate()
var can_move = true


func _add_a_scene_manually(node):
	print(node.name)
	print(node.get_children())
	selected_object = node
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	var tree = get_tree()
	var cur_scene = tree.get_current_scene()
	
	if node.name != "buddha":
		tree.get_root().add_child(object_scene)
		tree.get_root().remove_child(cur_scene)
		tree.set_current_scene(object_scene)
	else:
		tree.get_root().add_child(character_selection_scene)
		tree.get_root().remove_child(cur_scene)
		tree.set_current_scene(character_selection_scene)

func _transition_to_buddha_minigame(node):
	var tree = get_tree()
	var cur_scene = tree.get_current_scene()
	var next_scene = null
	
	if node == "Scholar":
		next_scene = preload("res://scenes/quiz.tscn").instantiate()
	else:
		next_scene = preload("res://scenes/world.tscn").instantiate()
	
	tree.get_root().add_child(next_scene)
	tree.get_root().remove_child(cur_scene)
	tree.set_current_scene(next_scene)
	
