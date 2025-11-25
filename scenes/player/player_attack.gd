extends State

class_name PlayerAttack

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."
@onready var hitbox_attack_ground_1_right: Area2D = $"../../HitboxAttackGround1Right"
@onready var hitbox_attack_ground_1_left: Area2D = $"../../HitboxAttackGround1Left"

func enter() -> void:
	anim_sprite.animation_finished.connect(on_anim_finished)
	anim_sprite.play("attack_ground_1")
	if player.anim_sprite.flip_h == false:
		hitbox_attack_ground_1_right.monitoring = true
	else:
		hitbox_attack_ground_1_left.monitoring = true


func exit() -> void:
	anim_sprite.animation_finished.disconnect(on_anim_finished)
	hitbox_attack_ground_1_right.monitoring = false
	hitbox_attack_ground_1_left.monitoring = false
	
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func on_anim_finished() -> void:
	if player.velocity.x == 0.0:
		transition.emit(self, "Idle")
	else:
		transition.emit(self, "PlayerRun")
	pass
