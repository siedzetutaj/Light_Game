extends CharacterBody2D
class_name PlayerLight
@export var ray_cast: RayCast2D
@export var spot_ray_cast: RayCast2D
@export var area : Area2D
@export var spot_area: Area2D

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
	var direction: Vector2
	#light movement
	if offset > 2 || offset < -2:
		direction = (mouse_postion - position).normalized()
		
		
	if Input.is_action_pressed("mouse_right"):
		spot_area.visible=true
		area.visible=false
		if is_player_in_range(spot_area):
			raycast_to_player(spot_area.get_overlapping_bodies()[0],spot_ray_cast)
		else:
			on_player_invisible()
	else: 
		spot_area.visible=false
		area.visible=true
		velocity= direction*speed 
		move_and_slide() 
		if is_player_in_range(area):
			raycast_to_player(area.get_overlapping_bodies()[0],ray_cast)
		else:
			on_player_invisible()
	
	
func raycast_to_player(player:Node2D, ray:RayCast2D)->void:
	var distance := (player.position-position).length()
	var direction:=(player.position-position).normalized()
	
	ray.target_position = direction * distance
	var collider := ray.get_collider()
	var can_see_player:= collider == player
	if can_see_player:
		on_player_visible()
	else:
		on_player_invisible()
	
func is_player_in_range(curr_area:Area2D) -> bool:
	return curr_area.get_overlapping_bodies().size() >0
	
func on_player_visible():
	player_visible.emit()
	

func on_player_invisible():
	player_invisible.emit()
	
	

