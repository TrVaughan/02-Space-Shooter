extends Node2D

var max_meteors = 3
var Meteors = load("res://Meteors/Meteor_scene.tscn")


func _physics_process(_delta):
	if get_child_count() < max_meteors:
		if randf() < .01:
			var Meteor_summon = Meteors.instance()
			Meteor_summon.position.y = -100
			Meteor_summon.position.x = randi() % 1024
			add_child(Meteor_summon)

func _ready():
	randomize()
