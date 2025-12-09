extends Area2D

class_name Hitbox

@onready var character: Character = $"../"

func _ready() -> void:
	connect("body_entered", on_hit)
	pass


func on_hit(body) -> void:
	var knockback_direction: int

	if body is Character:
		if body.position.x < character.position.x:
			knockback_direction = -1
		else:
			knockback_direction = 1
		body.hurt(character.get_power())
		body.knockback("low", knockback_direction)
	pass
