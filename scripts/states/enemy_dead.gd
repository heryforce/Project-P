extends State

class_name EnemyDead

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var enemy: Enemy = $"../.."

func enter() -> void:
	anim_sprite.play("dead")

func exit() -> void:
	enemy.queue_free()
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass