extends State

class_name EnemyIdle

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var enemy: Enemy = $"../.."
@onready var idle_timer: Timer = $"../../IdleTimer"

func enter() -> void:
	enemy.sig_hurt.connect(on_sig_hurt)
	idle_timer.connect("timeout", _on_timer_timeout)
	idle_timer.start()
	anim_sprite.play("idle")

func exit() -> void:
	idle_timer.disconnect("timeout", _on_timer_timeout)
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	transition.emit(self, "EnemyWander")
	pass

func on_sig_hurt() -> void:
	transition.emit(self, "EnemyHurt")