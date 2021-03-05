extends Area2D

var speed = .3
var velocity = Vector2.ZERO
var enemies = []


func _physics_process(_delta):
	position += velocity 
	velocity.y -= speed 
	if position.y <0:
		queue_free()

func _on_Timer_timeout():
	queue_free()

func _ready():
	pass

func _on_Nuke_scene_body_entered(_body):
	for e in enemies:
		e.die(5)
	queue_free()


func _on_Area2D_body_entered(body):
	enemies.append(body)


func _on_Area2D_body_exited(body):
	for e in enemies:
		if body.name == e.name:
			enemies.erase(e)
