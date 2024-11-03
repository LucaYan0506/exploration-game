extends Node

@onready var heartscontainer: HBoxContainer = $HeartsContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	heartscontainer.setMaxHearts(Global.player_maxHealth)
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass



func _on_fight_pressed() -> void:
	if Global.playerTurn:
		var hurts = randi_range(1,4)
		Global.enemyHp -= hurts
		
		if Global.enemyHp <= 0:
			Global.playerWin = true
			print("You won")
			get_tree().change_scene_to_file("res://scene/background1.tscn")
			return
		else:
			print("enemy hp: " + str(Global.enemyHp))

		Global.player_maxHealth -= hurts
		for child in heartscontainer.get_children():
			heartscontainer.remove_child(child)
			child.queue_free()
		heartscontainer.setMaxHearts(Global.player_maxHealth)

		if Global.player_maxHealth <= 0:
			print("You lost")
			return

		# 切换到敌人的回合
		Global.playerTurn = false
		enemyAction()
	else:
		print("not your turn")
	
func enemyAction() -> void:
	Global.mHp -= randi_range(1,4);
	
	Global.playerTurn = true
	print("player hp:" + str(Global.mHp))
	if (Global.mHp <= 0):
		print("You lost")
		Global.playerWin = false
		get_tree().change_scene_to_file("res://main.tscn")
	
		

func _on_run_pressed() -> void:
	Global.mHp -= 4
	if (Global.mHp <= 0):
		print("You lost")
		Global.playerWin = false
		get_tree().change_scene_to_file("res://main.tscn")
	else:
		print("player hp:" + str(Global.mHp))
		get_tree().change_scene_to_file("res://scene/background1" + ".tscn")


func _on_heal_pressed() -> void:
	print("You don't have the spray, can't heal yourself")
