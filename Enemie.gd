extends RigidBody2D

@export var floor_detect: RayCast2D
var speed := 2
var direction:=1
var motion: Vector2

func _physics_process(delta):
	if floor_detect==null:
		direction= -1*direction
	motion.x = direction*speed
	set_axis_velocity(motion)
