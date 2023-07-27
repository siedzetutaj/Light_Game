extends Control

class_name UI
@export var fear_bar:ProgressBar


func _enter_tree():
	var game_instance := get_tree().get_root().get_node("GameInstance") as GameInstance
	game_instance.user_interface = self
	
