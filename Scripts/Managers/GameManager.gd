extends Node
class_name GameManager

# Settings
var score: int = 0

#References
var qm : QuestionManager

#Signals
signal on_points_updated(p : int)

func _ready():
	if get_tree().has_group("QuestionManager"):
		qm = get_tree().get_first_node_in_group("QuestionManager")
		qm.answer_checked.connect(SetScore)

func SetScore(value: int) -> void:
	score += value
	if score < 0:
		score = 0
	GameStats.score = score
	on_points_updated.emit(score) # Score component needs score, but Popup component needs value :/

