extends Node2D
@onready var heartscontainer = $UI/HeartsContainer

#@export var target_level : PackedScene
func _on_pause_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/pause_menu.tscn")

func _ready():
	heartscontainer.setMaxHearts(Global.player_maxHealth)
	#heartscontainer.setCurrHearts()
