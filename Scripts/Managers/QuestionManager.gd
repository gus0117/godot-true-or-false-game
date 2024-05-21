extends Node


# Variables
var currentQuestion : Question :
	get:
		return currentQuestion
var questionList : Array[Question] = []
var index : int = 0 :
	get:
		return index

# Signals


func _ready():
	questionList = QLManager.get_questions()

func savePlayerAnswer(ans: Question.Answer) -> void:
	currentQuestion.playerAnswer = ans
	pass

func getNextQuestion() -> Question:
	var currentQuestion = Question.new()
	currentQuestion = questionList[index]
	index += 1
	return currentQuestion
	
func getAmountQuestions() -> int :
	return questionList.size()

func isGameFinish() -> bool:
	return index >= questionList.size()
