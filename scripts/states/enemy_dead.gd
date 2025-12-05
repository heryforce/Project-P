extends State

class_name EnemyDead

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var enemy: Enemy = $"../../"

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
	enemy.queue_free()
	transition.emit(self, "Idle")