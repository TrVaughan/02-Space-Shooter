extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = .5
onready var VP = get_viewport()

var Missle = load("res://Bullets/Missle.tscn")
var Nuke = load("res://Bullets/Nuke_scene.tscn")
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
	if Input.is_action_just_pressed("Fire2"):
		var Nuke_summon = Nuke.instance()
		Nuke_summon.position = position
		Bullets.add_child(Nuke_summon)

func get_input():
	var input_vector =  Vector2.ZERO 
	if Input.is_action_pressed("left"):
		input_vector.x = input_vector.x -1
	if Input.is_action_pressed("right"):
		input_vector.x = input_vector.x +1
	return input_vector

func die(_s):
	queue_free()
