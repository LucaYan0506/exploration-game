extends CharacterBody2D
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var character_body_2d: CharacterBody2D = $"."

var speed = 300

func _ready():
	if (character_body_2d.get_parent().name == "battleNode"): #don't move when we are in the battle animation
		sprite_2d.animation = "down"

func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed

func _physics_process(delta):
	if (character_body_2d.get_parent().name == "battleNode"): #don't move when we are in the battle animation
		return;
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
		
		
	
		
