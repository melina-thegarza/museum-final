extends Node

var questions = null
var current_question_index = 0
var score = 0
var answer_areas = []
var selected_answer_area = null
@onready var question_label = $question_area/question_label
@onready var feedback_label = $feedback_label

func _ready():
	#load questions from json file
	_load_questions()
	
	for child in $answers.get_children():
		if child is Area2D:
			answer_areas.append(child)
			

	_load_question()
	print(answer_areas)
	#_update_score_label()

func _load_questions():
	var file = "res://questions.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	questions = JSON.parse_string(json_as_text)

func _load_question():
	if current_question_index < questions.size():
		var current_question_data = questions[current_question_index]
		question_label.text = current_question_data["question"]

		# Assuming answers are in an AnswerContainer (e.g., VBoxContainer)
		for i in range(answer_areas.size()):
			if i < current_question_data["answers"].size():
				pass
				answer_areas[i].get_node("Label").text = current_question_data["answers"][i]
				
			else:
				answer_areas[i].visible = false # Hide extra answer areas

	else:
		# Quiz finished
		question_label.text = "Quiz Finished! Your score: " + str(score)
		for area in answer_areas:
			area.visible = false

func _set_selected_answer(answer):
	selected_answer_area = answer
	answer.get_node("ColorRect").modulate =  Color(0.9, 0.9, 1, 1) 

func _unset_selected_answer(answer):
	selected_answer_area = null
	answer.get_node("ColorRect").modulate =  Color(1, 1, 1, 1) 



func _input(event):
	if event.is_action_pressed("ui_accept") and selected_answer_area != null: # "ui_accept" is usually Spacebar/Enter
		var selected_answer = selected_answer_area.get_node("Label").text
		_check_answer(selected_answer)
		
func _check_answer(selected_answer):
	var current_question_data = questions[current_question_index]
	if selected_answer == current_question_data["correct_answer"]:
		feedback_label.add_theme_font_size_override("font_size", 12)
		feedback_label.text = "Correct!"
		score += 1
		selected_answer_area.get_node("ColorRect").modulate = Color(0.133333, 0.545098, 0.133333, 1)
	else:
		feedback_label.add_theme_font_size_override("font_size", 8)
		feedback_label.text = "Incorrect! The correct answer was: " + current_question_data["correct_answer"]
		selected_answer_area.get_node("ColorRect").modulate = Color(0.803922, 0.360784, 0.360784, 1) 
		
	feedback_label.visible = true
	Global.can_move = false
	selected_answer_area = null 
	await get_tree().create_timer(2.5).timeout
	Global.can_move = true  
	$"../scholar".position = Vector2(-150,15)
	
	current_question_index += 1
	_load_question()
	feedback_label.visible = false
	

func _on_answer_a_body_entered(body: Node2D) -> void:
	_set_selected_answer($answers/answerA)


func _on_answer_a_body_exited(body: Node2D) -> void:
	_unset_selected_answer($answers/answerA)


func _on_answer_b_body_entered(body: Node2D) -> void:
	_set_selected_answer($answers/answerB)
	

func _on_answer_b_body_exited(body: Node2D) -> void:
	_unset_selected_answer($answers/answerB)


func _on_answer_c_body_entered(body: Node2D) -> void:
	_set_selected_answer($answers/answerC)


func _on_answer_c_body_exited(body: Node2D) -> void:
	_unset_selected_answer($answers/answerC)


func _on_answer_d_body_entered(body: Node2D) -> void:
	_set_selected_answer($answers/answerD)


func _on_answer_d_body_exited(body: Node2D) -> void:
	_unset_selected_answer($answers/answerD)
