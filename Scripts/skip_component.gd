extends Control

# References
var qm : QuestionManager

func _ready():
	if get_tree().has_group("QuestionManager"):
		qm = get_tree().get_first_node_in_group("QuestionManager")

func _on_skip_btn_pressed():
	if qm != null:
		qm.savePlayerAnswer(Question.Answer.NA)
