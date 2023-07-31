extends Node

@export var player_body: CharacterBody2D
@export var animations: AnimationPlayer
@export var player_sprite: Sprite2D 

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and player_body.is_on_floor():
		animations.play("jump")
	elif !player_body.is_on_floor():
		animations.play("jump")
	elif player_body.velocity.length() == 0 and player_body.is_on_floor():
		animations.play("idle")
	elif player_body.is_on_floor():
		var animation_direction 
		if player_body.velocity.x < 0: 
			player_sprite.flip_h = true
		
		elif player_body.velocity.x > 0: 
			player_sprite.flip_h = false
		
		animation_direction = "right"
		animations.play("walk_"+ animation_direction)
