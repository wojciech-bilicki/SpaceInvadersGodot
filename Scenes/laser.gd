extends Area2D

class_name Laser

@export var speed = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= delta * speed

