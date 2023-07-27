extends CharacterBody2D
class_name Player

const SPEED = 150.0
const JUMP_VELOCITY = -250.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var fear:float = 100
var light:PlayerLight
var is_visible:bool

var game_instance:GameInstance

func _enter_tree():
	game_instance = get_tree().get_root().get_node("GameInstance") as GameInstance
	game_instance.player = self
	

func _ready():
	light = game_instance.player_light
	light.player_visible.connect(on_visible.bind())
	light.player_invisible.connect(on_invisible.bind())

func _process(_delta):
	if is_visible && fear<100:
		fear+=0.5
	elif !is_visible && fear>0:
		fear-=0.3
	
	if fear==0:
		print("GameOver")
	
	
#movement
func _physics_process(delta):
	
	
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()



func on_visible():
	is_visible = true
func on_invisible():
	is_visible = false



