extends Node

@export var mob_scene: PackedScene
var score

@onready var game_over_label: Label = $GameOverLabel  # 获取 "Game Over" Label 节点

func _ready():
	game_over_label.visible = false  # 初始隐藏 "Game Over" Label

func game_over() -> void:
	# 停止所有活动并显示 Game Over 信息
	$ScoreTimer.stop()
	$MobTimer.stop()
	get_tree().paused = true  # 暂停游戏树
	
	# 设置并显示 Game Over 文本
	game_over_label.visible = true
	game_over_label.text = "Game Over"
	game_over_label.modulate = Color(1, 0, 0, 1)  # 红色
	game_over_label.rect_position = (get_viewport().size - game_over_label.rect_size) / 2  # 居中显示

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	game_over_label.visible = false  # 隐藏 "Game Over" Label

# 场景切换代码
func _on_city_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/background1.tscn")

func _on_beach_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/background2.tscn")

func _on_glassland_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/background3.tscn")
