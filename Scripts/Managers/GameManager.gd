extends Node
class_name GameManager

# Settings
var score: int = 0
var amountQuestion: int = 0
var questionCount: int = 1

#Signals
signal on_points_updated(p : int)

func _ready():
	var qm: QuestionManager = get_tree().get_first_node_in_group("QuestionManager")
	qm.on_update_index.connect(AddQuestionCount)

func SetScore(value: int) -> void:
	score += value
	if score < 0:
		score = 0
	print("Score: " + str(score))
	on_points_updated.emit(value) # Score component needs score, but Popup component needs value :/

func SetAmountQuestions(value: int) -> void:
	amountQuestion = value

func AddQuestionCount() -> void:
	questionCount += 1
