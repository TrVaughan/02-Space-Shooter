extends Area2D

var speed = 5

func _physics_process(_delta):
	position.y += speed
	if position.y >= 620:
		queue_free()

func _ready():
	pass


func _on_Area2D_body_entered(body):
	body.die(0)
	queue_free()
