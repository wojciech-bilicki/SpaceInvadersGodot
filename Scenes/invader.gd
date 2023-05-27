extends Area2D

class_name Invader
signal on_invader_destroyed(points: int)

var config: Resource
@onready var sprite = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	sprite.texture = config.sprite_1
	animation_player.play(config.animation_name)


func _on_area_entered(area):
	if area is Laser:
		animation_player.play("destroy")
		area.queue_free()


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "destroy":
		queue_free()
		on_invader_destroyed.emit(config.points)
