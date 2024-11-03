extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass



func _on_fight_pressed() -> void:
	if Global.playerTurn:
		Global.enemyHp = Global.enemyHp - randi_range(1,4)
		print(Global.enemyHp)
		Global.playerTurn = false
	else:
		print("not your turn")


func _on_run_pressed() -> void:
	Global.mHp -= 4
	print(Global.mHp)
	get_tree().change_scene_to_file("res://scene/background1" + ".tscn")


func _on_heal_pressed() -> void:
	print("You don't have the spray, can't heal yourself")
