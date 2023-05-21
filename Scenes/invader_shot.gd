extends Area2D
class_name InvaderShot

@export var speed = 200

func _process(delta):
	position.y += speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if area is Player:
		(area as Player).on_player_destroyed()
		queue_free()
