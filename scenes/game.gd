extends Node2D

var user_interface:UI
var player:Player
var game_over_screen:GameOverScreen

func _process(_delta):
	user_interface.fear_bar.value = player.fear
	if player.fear <=0:
		get_tree().paused = true
		game_over_screen.visible = true
