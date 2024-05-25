extends Control

class_name PopupComponent

# References
@onready var label = $Label
@onready var bg_color = $BgColor
@onready var animation_player = $AnimationPlayer
@onready var correct_icon = $Icons/Correct
@onready var incorrect_icon = $Icons/Incorrect

#References
var questionManager : QuestionManager

# Color Settings
@export var failColor : Color
@export var successColor: Color

#Text Settings
@export var failText := "Incorrect"
@export var successText := "Correct"

# Signals
signal on_next # Signal to pass to next question

func _ready():
	if get_tree().has_group("QuestionManager"):
		questionManager = get_tree().get_first_node_in_group("QuestionManager")
		questionManager.answer_checked.connect(showPopup)
	correct_icon.visible = false
	incorrect_icon.visible = false

func showPopup(value: int) -> void:
	if value < 0:
		ShowIncorrectMsg()
	else:
		ShowCorrectMsg()
	#Left 0 option, than means No answer or skip question

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
	

func HidePopup() -> void:
	animation_player.play("hide")
	correct_icon.visible = false
	incorrect_icon.visible = false

func _on_next_btn_pressed():
	on_next.emit()
	HidePopup()
