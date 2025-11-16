extends State

class_name PlayerAttack

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."
@onready var hitbox_attack_ground_1: Area2D = $"../../HitboxAttackGround1"

func enter() -> void:
	anim_sprite.animation_finished.connect(on_anim_finished)
	anim_sprite.play("attack_ground_1")
	hitbox_attack_ground_1.monitorable = true


func exit() -> void:
	anim_sprite.animation_finished.disconnect(on_anim_finished)
	hitbox_attack_ground_1.monitorable = false
	pass
	
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func on_anim_finished() -> void:
	if player.velocity.x == 0.0:
		transition.emit(self, "PlayerIdle")
	else:
		transition.emit(self, "PlayerRun")
	pass
