extends Node2D

@onready var ufo_spawn_timer = $SpawnTimer
@export var ufo_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	(ufo_spawn_timer as SpawnTimer).setup_timer()


func _on_spawn_timer_timeout():
	var ufo = ufo_scene.instantiate()
	ufo.global_position = position
	get_tree().root.add_child(ufo)
