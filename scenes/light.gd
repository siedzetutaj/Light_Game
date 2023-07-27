extends CharacterBody2D
class_name PlayerLight
@export var ray_cast: RayCast2D
@export var area : Area2D

var speed :int = 400
var player_position 

signal player_visible
signal player_invisible

func _enter_tree():
	var game_instance := get_tree().get_root().get_node("GameInstance") as GameInstance
	game_instance.player_light = self

func _process(_delta):
	var mouse_postion: Vector2 = get_global_mouse_position()
	var offset = (mouse_postion - position).length()
	#light movement
	if offset > 2 || offset < -2:
		var direction = (mouse_postion - position).normalized()
		velocity= direction*speed 
		move_and_slide() 
		
	if is_player_in_range():
		raycast_to_player(area.get_overlapping_bodies()[0])
	else:
		on_player_invisible()
	
	
func raycast_to_player(player:Node2D)->void:
	var distance := (player.position-position).length()
	var direction:=(player.position-position).normalized()
	
	ray_cast.target_position = direction * distance
	var collider := ray_cast.get_collider()
	var can_see_player:= collider == player
	if can_see_player:
		on_player_visible()
	else:
		on_player_invisible()
	
func is_player_in_range() -> bool:
	return area.get_overlapping_bodies().size() >0
	
func on_player_visible():
	player_visible.emit()
	

func on_player_invisible():
	player_invisible.emit()
	
	

