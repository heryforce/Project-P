extends State

class_name PlayerAttack

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."
@onready var hitbox_simple_attack_1_r: Area2D = $"../../HitboxSimpleAttack1R"
@onready var hitbox_simple_attack_1_l: Area2D = $"../../HitboxSimpleAttack1L"

func enter() -> void:
	anim_sprite.animation_finished.connect(on_anim_finished)
	if player.anim_sprite.flip_h == false:
		hitbox_simple_attack_1_r.monitoring = true
	else:
		hitbox_simple_attack_1_l.monitoring = true
	anim_sprite.play("attack_ground_1")


func exit() -> void:
	anim_sprite.animation_finished.disconnect(on_anim_finished)
	hitbox_simple_attack_1_r.monitoring = false
	hitbox_simple_attack_1_l.monitoring = false
	
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func on_anim_finished() -> void:
	if player.velocity.x == 0.0:
		if player.is_on_floor():
			transition.emit(self, "Idle")
		else:
			transition.emit(self, "PlayerFall")
	else:
		transition.emit(self, "PlayerRun")
	pass
