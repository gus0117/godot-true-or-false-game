extends Control

class_name ScoreResult

@onready var score = $VBoxContainer/Score
@onready var correct_score = $VBoxContainer/CorrectScore

func _ready():
	show_score(GameStats.score, GameStats.correct_answers)

func show_score(s: int, cs: int) -> void:
	score.text = str(s)
	correct_score.text = str(cs)
