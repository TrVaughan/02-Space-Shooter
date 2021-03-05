extends KinematicBody2D
func _ready():
	randomize()

var laser = load("res://Enemies/EnemyFire_scene.tscn")
onready var Bullets = get_node("/root/Game/Bullets")
var speed = 2
var ready_to_move = true 



func _on_Shoot_timeout():
	if randf() < 0.2 and position.y >0:
		var Enemy_Shoot = laser.instance()
		Enemy_Shoot.position = position 
		Bullets.add_child(Enemy_Shoot)


func _on_Move_timeout():
	if randf() < 0.2 and ready_to_move:
		var new_position = Vector2(randi() % 1024, randi() % 500)
		$Tween.interpolate_property(self, "position", position, new_position, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		position = new_position 
		$Tween.start() 
		ready_to_move = false 

func die(s):
	Global.score += s
	queue_free()

func _on_Tween_tween_all_completed():
	ready_to_move = true
