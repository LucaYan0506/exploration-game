extends CharacterBody2D

@onready var character_body_2d: CharacterBody2D = $"."
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _ready():
	if (character_body_2d.get_parent().name == "battleNode"): #don't move when we are in the battle animation
		sprite_2d.animation = "default"
		
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "MainChar"):
		get_tree().change_scene_to_file("res://scene/battle.tscn")
