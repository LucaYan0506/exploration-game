extends HBoxContainer
@onready var HeartGuiClass = preload("res://scene/heart_gui.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setMaxHearts(max: int):
	for i in range(1,Global.mHp):
		var heart = HeartGuiClass.instantiate()
		add_child(heart)
