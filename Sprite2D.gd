extends Sprite2D

@export var player_body: CharacterBody2D
@export var appear_value:float = 100

func _process(delta):
	modulate.a = (appear_value - player_body.fear)/100
	pass
