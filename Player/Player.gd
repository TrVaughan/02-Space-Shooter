extends Position2D

var speed = 2 
onready var VP = get_viewport()

var Missle = load("res://Bullets/Missle.gd")
onready var Bullets = get_node("/root/Game/Bullets")


func _ready():
	pass

func _process(_delta):
	position = VP.get_mouse_position()
	position.x = clamp(position.x, 0, VP.get_visible_rect().size.x)
	position.y = clamp(position.y, 0, VP.get_visible_rect().size.y)
	if Input.is_action_pressed(shoot1):
		var missle = Missle.instance()
