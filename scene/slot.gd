extends Panel

@onready var backgroundsprite: Sprite2D = $background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/item

# 更新道具显示状态
func update(item: InventoryItem) -> void:
	if item == null:  # 如果 item 参数为空
		backgroundsprite.frame = 0
		itemSprite.visible = false
	else:  # 如果 item 有内容
		backgroundsprite.frame = 1
		itemSprite.visible = true
		itemSprite.texture = item.texture  # 设置 item 的纹理
