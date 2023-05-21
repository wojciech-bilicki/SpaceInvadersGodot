extends Node2D

@export var projectile_scene: PackedScene
@onready var spawn_timer: SpawnTimer = $SpawnTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_timer.setup_timer()
	spawn_timer.timeout.connect(on_spawn_timer_timeout)


func on_spawn_timer_timeout():
	var projectile = projectile_scene.instantiate()
	var projectile_sprite = projectile.get_node("Sprite2D") as Sprite2D
	projectile_sprite.modulate = Color(0.67, 0.2, 0.2, 1)
	projectile.global_position = global_position
	get_tree().root.add_child(projectile)
	spawn_timer.setup_timer()
