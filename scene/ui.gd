extends CanvasLayer

@onready var inventory = $InventoryGui

func _ready():
	inventory.close()

func _input(event):
	if Global.foundItem:
		inventory.update()
		Global.foundItem = false
	if event.is_action_pressed("toggle_inventory"):
		if inventory.isOpen:
			inventory.close()
		else:
			inventory.open()
