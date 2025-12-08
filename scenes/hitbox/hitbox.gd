extends Area2D

class_name Hitbox

@onready var char: Character = $"../"

func _ready() -> void:
	connect("body_entered", on_hit)
	pass


func on_hit(body) -> void:
	if body is Character and body != self:
		body.hurt(char.getPower())
	pass
