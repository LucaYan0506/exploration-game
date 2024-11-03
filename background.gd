extends Node2D

#@export var target_level : PackedScene
func _on_pause_pressed() -> void:
	get_tree().change_scene_to_file("res://pause_menu.tscn")
