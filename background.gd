extends Node2D

#@export var target_level : PackedScene

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
