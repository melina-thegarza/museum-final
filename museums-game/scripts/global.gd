extends Node

var player_current_attack = false

var selected_object = null


var object_scene = preload("res://scenes/level_2.tscn").instantiate()



func _add_a_scene_manually(node):
	print(node.name)
	print(node.get_children())
	selected_object = node
	# This is like autoloading the scene, only
	# it happens after already loading the main scene.
	var tree = get_tree()
	var cur_scene = tree.get_current_scene()
	tree.get_root().add_child(object_scene)
	tree.get_root().remove_child(cur_scene)
	tree.set_current_scene(object_scene)
