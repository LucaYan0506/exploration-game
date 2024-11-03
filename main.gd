extends Node

@export var mob_scene: PackedScene
var score

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_city_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/background1.tscn")


func _on_beach_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/background2.tscn")


func _on_glassland_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/background3.tscn")
