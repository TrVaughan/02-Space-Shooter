extends Position2D

var velocity = Vector2.ZERO
var speed = 2 
onready var VP = get_viewport()

var Missle = load("res://Bullets/Missle.gd")
onready var Bullets = get_node("/root/Game/Bullets")


func _ready():
	pass

func _process(_delta):
	velocity += get_input()*speed
	poition += velocity
	if position.x >= 1024:
		velocity = Vector2.ZERO
		position.x = 1024
	if position.x <= 0:
		velocity = Vector2.ZERO
		position.x = 0
		
	if Input.is_action_pressed("Fire1"):
		var missle = Missle.instance()
		missle.position = position
		Bullets.add_child(Missle)
