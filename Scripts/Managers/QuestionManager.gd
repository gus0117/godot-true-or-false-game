extends Node

class_name QuestionManager
# Variables
var currentQuestion : Question :
	get:
		return currentQuestion
var questionList : Array[Question] = []
var index : int = 0 :
	get:
		return index

# Signals
signal on_update_question(quest: String) #emit when current question was updated
signal on_update_index #emit when index was updated

func _ready():
	questionList = QLManager.get_questions()
	getNextQuestion()

func savePlayerAnswer(ans: Question.Answer) -> void:
	currentQuestion.playerAnswer = ans
	pass

func getNextQuestion() -> Question:
	var currentQuestion = Question.new()
	currentQuestion = questionList[index]
	index += 1
	on_update_question.emit(currentQuestion.question)
	on_update_index.emit()
	return currentQuestion
	
func getAmountQuestions() -> int :
	return questionList.size()

func isGameFinish() -> bool:
	return index >= questionList.size()
