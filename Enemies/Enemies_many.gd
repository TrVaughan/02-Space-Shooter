extends Node2D

func _ready():
	pass

var max_enemies = 3
var Enemies = load("res://Enemies/Enemy_scene.tscn")


func _physics_process(_delta):
	if get_child_count() < max_enemies:
		if randf() < .01:
			var Enemy_summon = Enemies.instance()
			Enemy_summon.position.y = -100
			Enemy_summon.position.x = randi() % 1024
			add_child(Enemy_summon)
