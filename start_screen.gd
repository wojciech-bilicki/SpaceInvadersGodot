extends CanvasLayer


@onready var invader_1_texture = %Invader1Texture
@onready var invader_1_label = %Invader1Label
@onready var invader_2_texture = %Invader2Texture
@onready var invader_2_label = %Invader2Label
@onready var invader_3_texture = %Invader3Texture
@onready var invader_3_label = %Invader3Label

@onready var timer = $Timer

var node_array = []

func _ready():
	node_array.append(invader_1_texture)
	node_array.append(invader_1_label)
	node_array.append(invader_2_texture)
	node_array.append(invader_2_label)
	node_array.append(invader_3_texture)
	node_array.append(invader_3_label)
	for element in node_array:
		(element as Control).modulate = Color.TRANSPARENT
	timer.timeout.connect(on_timer_timeout)
	

func on_timer_timeout():
	var node =  node_array.pop_front() as Control
	if node != null:
		node.modulate = Color.GHOST_WHITE
	else:
		timer.stop()
		timer.queue_free()
	


func load_game():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
