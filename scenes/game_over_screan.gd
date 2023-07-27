extends Control
class_name GameOverScreen

func _enter_tree():
	var game_instance := get_tree().get_root().get_node("GameInstance") as GameInstance
	game_instance.game_over_screen = self

func _on_button_button_down():
	get_tree().paused = false
	var game_instance := get_tree().get_root().get_node("GameInstance") as GameInstance
	game_instance.game_over()


func _on_button_2_button_down():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_button_3_button_down():
	get_tree().quit()
