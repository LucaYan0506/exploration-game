extends Panel

@onready var backgroundsprite: Sprite2D = $background
@onready var itemSprite: Sprite2D =$CenterContainer/Panel/item

func update(item: InventoryItem):
	if !item:
		backgroundsprite.frame = 0
		itemSprite.visible = false
	else:
		backgroundsprite.frame = 1
		itemSprite.visible = true
		itemSprite.texture = item.texture
