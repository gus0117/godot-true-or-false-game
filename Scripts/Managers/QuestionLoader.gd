extends Node

class_name QuestionLoader
var data_url := "res://Data/data.json"

func get_questions() -> Array[Question]:
	var questionList : Array[Question] = []
	
	if not FileAccess.file_exists(data_url):
		print("File doesn't exist")
		return questionList #null
	
	var json_content = FileAccess.open(data_url, FileAccess.READ)
	var parse_result  = JSON.parse_string(json_content.get_as_text())
	
	if parse_result == null:
		print("Error reading file")
		return questionList #null
	
	var i := 0
	for question in parse_result:
		var questionAux = Question.new()
		questionAux.question = question["question"]
		questionAux.answer = question["answer"]
		questionAux.id = i
		i += 1
		questionList.append(questionAux)
	return questionList
