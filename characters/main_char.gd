extends CharacterBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@export var maxHealth = 10
@onready var currentHealth: int = maxHealth

var speed = 300

# 引用 enermy 节点
@onready var enermy = get_parent().get_node("Enermy")  # 替换为 Enermy 节点的正确路径

func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
	if velocity.x < 0:
		sprite_2d.flip_h = true
		sprite_2d.animation = "right"
	elif velocity.x > 0:
		sprite_2d.flip_h = false
		sprite_2d.animation = "right"
	elif velocity.y > 0:
		sprite_2d.animation = "down"
	elif velocity.y < 0:
		sprite_2d.animation = "up"
	else:
		sprite_2d.animation = "default"

func _ready() -> void:
	# 检查是否成功获取到 enermy 节点
	if enermy:
		print("Enermy current health:", enermy.current_health)
		
		# 调用 enermy.gd 中的函数
		enermy.take_damage(10)
		print("Enermy health after taking damage:", enermy.current_health)
	else:
		print("Enermy node not found")

func _on_fight_pressed() -> void:
	if maxHealth >= 2 and enermy.max_health >= 3:
		maxHealth -= 2
		enermy.take_damage(3)
	elif maxHealth < 2:
		print("Your health is too low to fight!")
	else:
		print("Enermy health is too low to fight!")

func _on_defense_pressed() -> void:
	if maxHealth >= 1:
		maxHealth -= 1
	else:
		# 获取游戏实例并调用 game_over 函数
		var game_instance = get_tree().get_node("Game")  # 确保路径正确
		game_instance.game_over()

func _on_run_pressed() -> void:
	if maxHealth >= 51:
		maxHealth -= 50
	else:
		print("HP is too low, cannot run!")
