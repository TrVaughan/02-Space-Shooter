extends Position2D

var velocity = Vector2.ZERO
var speed = 2 
onready var VP = get_viewport()

var Missle = load("res://Bullets/Missle.tscn")
onready var Bullets = get_node("/root/Game/Bullets")


func _ready():
	pass

func _physics_process(_delta):
	velocity += get_input()*speed
	position += velocity
	if position.x >= 1024:
		velocity = Vector2.ZERO
		position.x = 1024
	if position.x <= 0:
		velocity = Vector2.ZERO
		position.x = 0
		
	if Input.is_action_just_pressed("Fire1"):
		var missle = Missle.instance()
		missle.position = position
		Bullets.add_child(missle)

func get_input():
	var input_vector =  Vector2.ZERO 
	if Input.is_action_pressed("left"):
		input_vector.x = input_vector.x -1
	if Input.is_action_pressed("right"):
		input_vector.x = input_vector.x +1
	if Input.is_action_pressed("up"):
		input_vector.y = input_vector.y -1
	if Input.is_action_pressed("down"):
		input_vector.y = input_vector.y +1
	return input_vector
	
