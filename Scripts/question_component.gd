extends PanelContainer

@onready var question = $Bg/Question


func updateQuestion(quest: String) -> void:
	question.text = quest

func _on_question_manager_on_update_question(quest):
	if typeof(quest) == TYPE_STRING:
		updateQuestion(quest)
