extends Node
class_name GameManager

# Settings
var points: int = 0
var amountQuestion: int = 0
var questionCount: int = 1

#Signals
signal on_points_updated(p : int)

func _ready():
	var qm: QuestionManager = get_tree().get_first_node_in_group("QuestionManager")
	qm.on_update_index.connect(AddQuestionCount)

func SetPoints(value: int) -> void:
	print("added points")
	points += value
	on_points_updated.emit(points)

func SetAmountQuestions(value: int) -> void:
	amountQuestion = value

func AddQuestionCount() -> void:
	questionCount += 1
