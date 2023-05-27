extends Area2D

@export var sprite: Sprite2D;

@export var sprite_array: Array[Texture2D]

var damage = 0
const MAX_DAMAGE = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	self.area_entered.connect(_on_area_entered)


func _on_area_entered(area):
	if area is Laser || area is InvaderShot:
		area.queue_free()
		if damage < MAX_DAMAGE:
			damage += 1
			sprite.texture = sprite_array[damage - 1]
		else:
			queue_free()
	
	if area is Invader:
		queue_free()
