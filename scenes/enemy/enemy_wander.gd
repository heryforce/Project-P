extends State

class_name EnemyWander

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var enemy: Enemy = $"../.."
@onready var wander_timer: Timer = $"../../WanderingTimer"
var turn: int = 1

func enter() -> void:
	if anim_sprite.flip_h == true:
		anim_sprite.flip_h = false
		turn = 1
	else:
		anim_sprite.flip_h = true
		turn = -1
	wander_timer.start()
	anim_sprite.play("run_first_frame")
	anim_sprite.play("run")

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	enemy.velocity.x = GameManager.SPEED * delta * turn
	print(turn)
	pass

func on_timer_timeout() -> void:
	print("transition to idle")
	enemy.velocity.x = 0.0
	transition.emit(self, "EnemyIdle")
	pass
	
