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
var amountQuestions := 10 # The amount of question to show in game.

# Signals
signal on_update_question(quest: String) #emit when current question was updated
signal on_update_index #emit when index was updated
signal answer_checked(ans: int) #Emit when the answer was checked and send if answer was correct = 1, incorrect = -1 or no answer = 0
signal amount_obtained(amunt: int) #Emit when the amount of questions has been obtained

func _ready():
	questionList = QLManager.get_questions()
	# When list loaded
	amount_obtained.emit(get_amount_questions())
	getNextQuestion()

#Register the player answer
func savePlayerAnswer(ans: Question.Answer) -> void:
	print("Answer recived")
	var i = questionList.find(currentQuestion) #find index from array
	if i >= 0:
		questionList[i].playerAnswer = ans
		answer_checked.emit(checkPlayerAnswer(ans))
	#Pass question anyway
	#getNextQuestion()

func checkPlayerAnswer(ans: Question.Answer) -> int:
	if ans == boolToAnswer(currentQuestion.answer):
		return 1 #Correct answer
	if ans == Question.Answer.NA:
		return 0 #No Answer
	return -1 # Incorrect answer

func boolToAnswer(ans: bool) -> Question.Answer:
	return Question.Answer.TRUE if ans == true else Question.Answer.FALSE

func getNextQuestion() -> Question:
	currentQuestion = Question.new()
	currentQuestion = questionList[index]
	index += 1
	on_update_question.emit(currentQuestion.question)
	on_update_index.emit()
	return currentQuestion
	
func get_amount_questions() -> int :
	return questionList.size()

func isGameFinish() -> bool:
	return index >= questionList.size()

func _on_popup_componet_on_next():
	getNextQuestion()
