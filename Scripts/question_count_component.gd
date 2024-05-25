extends MarginContainer

class_name QuestionCountComponent

@onready var count_label = $HBoxContainer/CountLabel
@onready var amount_label = $HBoxContainer/AmountLabel

var qm : QuestionManager
var index: int = 1

func _ready():
	if get_tree().has_group("QuestionManager"):
		qm = get_tree().get_first_node_in_group("QuestionManager")
		qm.amount_obtained.connect(update_amount_label)
		qm.on_update_index.connect(update_count_label)
	pass

func update_count_label() -> void:
	count_label.text = str(index)
	index += 1

func update_amount_label(amount: int) -> void:
	amount_label.text = "/ " + str(amount)
	qm.amount_obtained.disconnect(update_amount_label)
