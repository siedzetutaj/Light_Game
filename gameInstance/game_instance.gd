extends Node
class_name GameInstance
@export var game_scene: PackedScene
var player_light: PlayerLight 
var user_interface: UI
var player: Player
var game_over_screen: GameOverScreen
var game_scene_instance: Node2D
@export var main_menu: MainMenu

func _enter_tree():
	main_menu.play_button.button_down.connect(start_game.bind())


func start_game():
	game_scene_instance = game_scene.instantiate()
	add_child(game_scene_instance)
	game_scene_instance.user_interface = user_interface
	game_scene_instance.player = player
	game_scene_instance.game_over_screen = game_over_screen


func game_over():
	remove_child(game_scene_instance)
	game_scene_instance.queue_free()
	start_game()


func _on_game_over_screan_go_to_main_menu():
	game_over_screen.visible = false
	main_menu.visible = true
