extends ColorRect

@export var player_body: CharacterBody2D


func _process(_delta):
	modulate.a = (100 - player_body.fear)/100
