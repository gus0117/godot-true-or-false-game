extends Node

var points: int = 0
var amountQuestion: int = 0
var questionCount: int = 1

func _ready():
	var qm: QuestionManager = get_tree().get_nodes_in_group("QuestionManager")[0]
	qm.on_update_index.connect(AddQuestionCount)

func AddPoints(value: int) -> void:
	points += value

func SetAmountQuestions(value: int) -> void:
	amountQuestion = value

func AddQuestionCount() -> void:
	questionCount += 1
