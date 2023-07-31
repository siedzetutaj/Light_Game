extends CharacterBody2D
class_name Player



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


func on_visible():
	is_visible = true
func on_invisible():
	is_visible = false




