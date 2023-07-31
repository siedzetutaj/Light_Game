extends Node

@export var player_body: CharacterBody2D

func _process(_delta):
	if player_body.is_visible && player_body.fear<100:
		player_body.fear+=0.5
	elif !player_body.is_visible && player_body.fear>0:
		player_body.fear-=0.3
