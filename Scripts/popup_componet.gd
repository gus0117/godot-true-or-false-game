extends Control

class_name PopupComponent

# References
@onready var label = $Label
@onready var bg_color = $BgColor
@onready var animation_player = $AnimationPlayer
@onready var correct_icon = $Icons/Correct
@onready var incorrect_icon = $Icons/Incorrect
@onready var skip_icon = $Icons/Skip

#References
var questionManager : QuestionManager

# Color Settings
@export var failColor : Color
@export var successColor: Color
@export var skipColor: Color

#Text Settings
@export var failText := "Incorrect"
@export var successText := "Correct"
@export var skipText := "Skipped"

# Signals
signal on_next # Signal to pass to next question

func _ready():
	if get_tree().has_group("QuestionManager"):
		questionManager = get_tree().get_first_node_in_group("QuestionManager")
		questionManager.answer_checked.connect(showPopup)
	correct_icon.visible = false
	incorrect_icon.visible = false
	skip_icon.visible = false

func showPopup(value: int) -> void:
	match value:
		-1: ShowIncorrectMsg()
		0: ShowSkipMsg()
		1: ShowCorrectMsg()
		_: print("No actions for this value: " + str(value))

func ShowCorrectMsg() -> void:
	bg_color.material.set_shader_parameter("color", successColor)
	label.text = successText
	correct_icon.visible = true	
	animation_player.play("show")

func ShowIncorrectMsg() -> void:
	bg_color.material.set_shader_parameter("color", failColor)
	label.text = failText
	incorrect_icon.visible = true
	animation_player.play("show")
	
func ShowSkipMsg() -> void:
	bg_color.material.set_shader_parameter("color", skipColor)
	label.text = skipText
	skip_icon.visible = true
	animation_player.play("show")

func HidePopup() -> void:
	animation_player.play("hide")
	correct_icon.visible = false
	incorrect_icon.visible = false
	skip_icon.visible = false

func _on_next_btn_pressed():
	on_next.emit()
	HidePopup()
