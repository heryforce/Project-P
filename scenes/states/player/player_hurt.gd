extends State

class_name PlayerHurt

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."

func _ready():
	anim_sprite.connect("animation_finished", _on_animation_finished)
	pass

func enter() -> void:
	# player.stop_v()
	anim_sprite.play("hurt")
	if player.get_ignore_gravity() == true:
		player.set_ignore_gravity(false)

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	if player.getPv() <= 0:
		transition.emit(self, "PlayerDead")

func physics_update(delta: float) -> void:
	pass

func _on_animation_finished() -> void:
	transition.emit(self, "Idle")