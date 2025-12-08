extends State

class_name PlayerDead

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../../"

func enter() -> void:
	anim_sprite.animation_finished.connect(on_anim_finished)
	anim_sprite.play("dead")

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func on_anim_finished() -> void:
	anim_sprite.animation_finished.disconnect(on_anim_finished)
	player.queue_free()
	print("YOU'RE DEAD, WHAT A SHAME...")