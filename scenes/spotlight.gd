extends Area2D


func _process(delta):
	var mouse_postion: Vector2 = get_global_mouse_position()
	look_at(mouse_postion)
	rotation-=89.5
