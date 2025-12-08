extends State

class_name EnemyAttack

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var hitbox_attack_r: Area2D = $"../../HitboxAttackR"
@onready var hitbox_attack_l: Area2D = $"../../HitboxAttackL"
@onready var enemy: Enemy = $"../.."
@onready var attack_timer: Timer = $"../../AttackTimer"

func enter() -> void:
	if attack_timer.time_left > 0.0:
		transition.emit(self, "Chase")
	anim_sprite.animation_finished.connect(on_anim_finished)
	if enemy.anim_sprite.flip_h == false:
		hitbox_attack_r.monitoring = true
	else:
		hitbox_attack_l.monitoring = true
	anim_sprite.play("attack_ground_1")
	pass

func exit() -> void:
	attack_timer.start()
	anim_sprite.animation_finished.disconnect(on_anim_finished)
	hitbox_attack_r.monitoring = false
	hitbox_attack_l.monitoring = false
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func on_anim_finished() -> void:
	transition.emit(self, "Chase")