extends CharacterBody2D
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@export var maxHealth = 10
@onready var currentHealth: int = maxHealth

var speed = 300

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
		
		
	
		
