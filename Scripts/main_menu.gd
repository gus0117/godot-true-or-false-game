extends Control

@export var game_scene = preload("res://Scenes/ui_true_or_false.tscn")
@onready var confirmation_dialog: ConfirmationDialog = $ConfirmationDialog



func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)



func _on_quit_pressed() -> void:
	confirmation_dialog.show()
	pass

func _on_confirmation_dialog_confirmed() -> void:
	get_tree().quit()
