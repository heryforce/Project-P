extends State

class_name EnemyWander

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var enemy: Enemy = $"../.."
@onready var wander_timer: Timer = $"../../WanderingTimer"

func _ready():
	enemy.sig_hurt.connect(on_sig_hurt)
	enemy.sig_chase.connect(on_sig_chase)
	pass

func enter() -> void:
	wander_timer.connect("timeout", on_timer_timeout)
	wander_timer.start()
	if anim_sprite.flip_h == true:
		anim_sprite.flip_h = false
	else:
		anim_sprite.flip_h = true
	anim_sprite.play("run_first_frame")
	if anim_sprite.flip_h == true:
		enemy.move_left()
	else:
		enemy.move_right()

func exit() -> void:
	wander_timer.disconnect("timeout", on_timer_timeout)
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func on_timer_timeout() -> void:
	print("TIMEOUT")
	enemy.stop_v()
	transition.emit(self, "Idle")
	pass

func on_sig_hurt() -> void:
	transition.emit(self, "Hurt")

func on_sig_chase() -> void:
	transition.emit(self, "Chase")
	pass