extends Area2D

func _on_area_entered(area):
	if area is Laser: 
		area.queue_free()
