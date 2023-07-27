extends PointLight2D

@export var ray_cast : RayCast2D
@export var area : Area2D

func _process(delta: float) -> void:
	position = get_global_mouse_position()
	if is_player_in_range():
		raycast_to_player(area.get_overlapping_bodies()[0])
	pass

func raycast_to_player(player : Node2D) -> void:
	var distance := (player.position - position).length()
	var direction := (player.position - position).normalized()
	
	ray_cast.target_position = direction * distance
	var collider := ray_cast.get_collider()

func is_player_in_range() -> bool:
	return area.get_overlapping_bodies().size() > 0
