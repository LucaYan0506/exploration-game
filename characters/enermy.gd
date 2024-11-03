extends CharacterBody2D

@onready var character_body_2d: CharacterBody2D = $"."  # 取得当前节点的引用
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

var max_health: int = 100  # 定义最大生命值
var current_health: int = max_health  # 当前生命值，初始值等于最大生命值

# 受到伤害的函数
func take_damage(damage: int) -> void:
	current_health = max(current_health - damage, 0)
	print("Enermy took damage, current health:", current_health)
	if current_health <= 0:
		die()

# 死亡函数
func die() -> void:
	print("Enermy has died")
	queue_free()  # 将 enermy 从场景中移除或做其他处理

func _ready() -> void:
	# 如果 enermy 在 battleNode 下，不允许移动
	if character_body_2d.get_parent().name == "battleNode":
		sprite_2d.animation = "default"
	else:
		# 正常情况可以播放其他动画或设置初始状态
		sprite_2d.animation = "idle"

# 处理碰撞逻辑
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "MainChar":
		print("Main character entered collision area")
		get_tree().change_scene_to_file("res://scene/battle.tscn")  # 切换到战斗场景
