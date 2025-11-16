extends State

class_name EnemyIdle

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var enemy: Enemy = $"../.."
@onready var idle_timer: Timer = $"../../IdleTimer"

func enter() -> void:
	idle_timer.start()
	anim_sprite.play("idle")

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	transition.emit(self, "EnemyWander")
	pass # Replace with function body.
