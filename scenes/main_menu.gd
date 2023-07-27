extends Control
class_name MainMenu
var game_instance: GameInstance
@export var play_button: BaseButton
func _enter_tree():
	game_instance = get_tree().get_root().get_node("GameInstance") as GameInstance
	game_instance.main_menu = self

func _on_button_button_down():
	self.visible = false


func _on_button_2_button_down():
	pass # Replace with function body.


func _on_button_3_button_down():
	get_tree().quit()
