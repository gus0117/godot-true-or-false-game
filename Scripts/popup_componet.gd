extends Control

# References
@onready var label = $Label
@onready var bg_color = $BgColor
@onready var animation_player = $AnimationPlayer

# Color Settings
@export var failColor : Color
@export var successColor: Color

#Text Settings
@export var failText := "Incorrect"
@export var successText := "Correct"

# Signals
signal on_next # Signal to pass to next question

func _ready():
	#ShowIncorrectMsg()
	pass

func ShowCorrectMsg() -> void:
	bg_color.material.set_shader_parameter("color", successColor)
	label.text = successText
	animation_player.play("show")

func ShowIncorrectMsg() -> void:
	bg_color.material.set_shader_parameter("color", failColor)
	label.text = failText
	animation_player.play("show")

func HidePopup() -> void:
	animation_player.play("hide")

func _on_next_btn_pressed():
	on_next.emit()
	HidePopup()
