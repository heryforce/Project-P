extends State

class_name PlayerHelmBreakerLand

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."


func enter() -> void:
	# anim_sprite.play("helm_break_land")
	anim_sprite.animation_finished.connect(is_anim_finished)
	

func exit() -> void:
	anim_sprite.animation_finished.disconnect(is_anim_finished)
	pass
	
	
func update(delta: float) -> void:
	pass

 
func physics_update(delta: float) -> void:
	pass

func is_anim_finished() -> void:
	transition.emit(self, "Idle")
