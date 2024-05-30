extends Node

var score: int = 0 :
	get: return score
	set(value): score = value

var amount_questions: int = 0 :
	get: return amount_questions

var correct_answers: int = 0 :
	get: return correct_answers

var questionList : Array[Question] = [] :
	get: return questionList
	set(value): 
		questionList = []
		questionList = value
		amount_questions = questionList.size()

func reset_stats() -> void:
	score = 0
	amount_questions = 0
	correct_answers = 0
	questionList = []

func set_questions(value: Array[Question]) -> void :
	questionList = []
	questionList = value

func add_correct_answer():
	correct_answers += 1

func set_score(value: int):
	score = value
