extends State

class_name EnemyHurt

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var enemy: Enemy = $"../.."

func _ready():
	anim_sprite.connect("animation_finished", _on_animation_finished)
	pass

func enter() -> void:
	enemy.stop_v()
	anim_sprite.play("hurt")

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	if enemy.getPv() <= 0:
		transition.emit(self, "Dead")

func physics_update(delta: float) -> void:
	pass

func _on_animation_finished() -> void:
	transition.emit(self, "Chase")
