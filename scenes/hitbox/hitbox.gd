extends Area2D

class_name Hitbox

func _ready() -> void:
	connect("body_entered", on_hit)
	pass


func on_hit(body) -> void:
	if body is Character and body != self:
		body.hurt(body.getPower())
	pass
