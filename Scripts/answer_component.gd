extends PanelContainer

class_name AnswerComponent

var questionManager : QuestionManager

func _ready():
	questionManager = get_tree().get_first_node_in_group("QuestionManager")

func SendAnswer(value: bool) -> void:
	var ans : Question.Answer = Question.Answer.TRUE if value else Question.Answer.FALSE
	questionManager.savePlayerAnswer(ans)

func _on_true_btn_pressed():
	SendAnswer(true)


func _on_false_btn_pressed():
	SendAnswer(false)
