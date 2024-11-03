extends Control

var isOpen: bool = false
@onready var inventory: Inventory = preload("res://Inventory/playerinventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

#func _ready():
	#update()


func update():
	print(Global.foundI)
	slots[Global.foundI].update(inventory.items[0])
	Global.foundI += 1
	#for i in range(min(inventory.items.size(), slots.size())):
		#slots[i].update(inventory.items[i])
	pass
func open():
	visible = true
	isOpen = true
	
	
	
func close():
	visible = false
	isOpen = false
