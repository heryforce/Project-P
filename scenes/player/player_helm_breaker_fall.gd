extends State

class_name PlayerHelmBreakerFall

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."
@onready var skill_timer: Timer = $"../../SkillTimer"

var timeout: bool = false

func enter() -> void:
	skill_timer.timeout.connect(on_timer_timeout)
	player.ignore_gravity = true
	player.velocity.x = 0.0
	player.velocity.y = 0.0
	# anim_sprite.play("helm_break_fall")
	skill_timer.start(0.3)
	

func exit() -> void:
	skill_timer.timeout.disconnect(on_timer_timeout)
	player.ignore_gravity = false
	timeout = false
	pass
	
	
func update(delta: float) -> void:
	pass

 
func physics_update(delta: float) -> void:
	if timeout == true:
		player.velocity.y += GameManager.HELM_BREAKER_SPEED
	if player.is_on_floor():
		transition.emit(self, "PlayerHelmBreakerLand")

func on_timer_timeout() -> void:
	timeout = true
