extends Area2D

var entered = false

func _on_body_entered(_body: PhysicsBody2D):
	entered = true


func _on_body_exited(_body):
	entered = false

func _process(_delta):
	if entered  == true:
		transition.change_scene_to_file("res://Scene/test.tscn")
