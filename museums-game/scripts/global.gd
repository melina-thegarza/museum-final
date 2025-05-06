extends Node

var player_current_attack = false

var selected_object = null


var object_scene = preload("res://scenes/level_2.tscn").instantiate()
var character_selection_scene = preload("res://scenes/selection_screen.tscn").instantiate()
var can_move = true
var end_of_kid_minigame = false


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
	end_of_kid_minigame = false
	var tree = get_tree()
	var cur_scene = tree.get_current_scene()
	var next_scene = null
	
	if node == "Scholar":
		next_scene = preload("res://scenes/quiz.tscn").instantiate()
	else:
		next_scene = preload("res://scenes/kid_chase.tscn").instantiate()
	
	tree.get_root().add_child(next_scene)
	tree.get_root().remove_child(cur_scene)
	tree.set_current_scene(next_scene)

func _transition_to_buddha_minigame_instructions(node):
	end_of_kid_minigame = false
	var tree = get_tree()
	var cur_scene = tree.get_current_scene()
	var next_scene = null
	
	if node == "Scholar":
		#update
		next_scene = preload("res://scenes/quiz.tscn").instantiate()
	else:
		next_scene = preload("res://scenes/kid_chase_instructions.tscn").instantiate()
	
	tree.get_root().add_child(next_scene)
	tree.get_root().remove_child(cur_scene)
	tree.set_current_scene(next_scene)

func _return_to_buddha_selection():
	var tree = get_tree()
	var cur_scene = tree.get_current_scene()
	var next_scene = preload("res://scenes/selection_screen.tscn").instantiate()
	
	tree.get_root().add_child(next_scene)
	tree.get_root().remove_child(cur_scene)
	tree.set_current_scene(next_scene)

func _won_buddha_minigame():
	var tree = get_tree()
	var cur_scene = tree.get_current_scene()
	var next_scene = preload("res://scenes/won_kid_minigame.tscn").instantiate()
	
	tree.get_root().add_child(next_scene)
	tree.get_root().remove_child(cur_scene)
	tree.set_current_scene(next_scene)
	

func _loss_buddha_minigame():
	var tree = get_tree()
	var cur_scene = tree.get_current_scene()
	var next_scene = preload("res://scenes/loss_buddha_minigame.tscn").instantiate()
	
	tree.get_root().add_child(next_scene)
	tree.get_root().remove_child(cur_scene)
	tree.set_current_scene(next_scene)

func _return_to_main_screen():
	var tree = get_tree()
	var cur_scene = tree.get_current_scene()
	var next_scene = preload("res://scenes/world.tscn").instantiate()
	
	tree.get_root().add_child(next_scene)
	tree.get_root().remove_child(cur_scene)
	tree.set_current_scene(next_scene)

func _go_to_instructions_screen():
	var tree = get_tree()
	var cur_scene = tree.get_current_scene()
	var next_scene = preload("res://scenes/instructions_screen.tscn").instantiate()
	
	tree.get_root().add_child(next_scene)
	tree.get_root().remove_child(cur_scene)
	tree.set_current_scene(next_scene)
