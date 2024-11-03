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
		Global.enemyHp = Global.enemyHp - randi_range(1,4)
		print("enemy hp: " + str(Global.enemyHp))
		Global.playerTurn = false
		if (Global.enemyHp <= 0):
			Global.playerWin = true
			print("You won")
			get_tree().change_scene_to_file("res://scene/background1" + ".tscn")
			return;
	else:
		print("not your turn")
	enemyAction()
	
func enemyAction() -> void:
	var hurts = randi_range(1,4)
	Global.mHp -= hurts;
	Global.playerTurn = true
	print("player hp:" + str(Global.mHp))
	
	for child in heartscontainer.get_children():
		hurts -= 1;
		if hurts < 0:
			break;
		heartscontainer.remove_child(child)
		child.queue_free()
		
	
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
