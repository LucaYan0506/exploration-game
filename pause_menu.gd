extends Control


func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://background.tscn")




func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
