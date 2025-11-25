extends Hitbox

@onready var player: Player = $"../"

func _ready() -> void:
	connect("body_entered", on_hit)
	pass


func on_hit(body) -> void:
	if body is Enemy:
		body.hurt(player.getPower())
	pass
