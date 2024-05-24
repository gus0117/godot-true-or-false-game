extends MarginContainer

#References
@onready var score_label = $HBoxContainer/ScoreLabel
var gameManager : GameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	UpdateScoreLabel(0)
	gameManager = get_tree().get_first_node_in_group("GameManager")
	gameManager.on_points_updated.connect(UpdateScoreLabel)

func UpdateScoreLabel(value: int) -> void:
	score_label.text = str(value)
