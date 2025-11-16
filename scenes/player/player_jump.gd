extends State

class_name PlayerJump

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."


func enter() -> void:
	anim_sprite.play("jump")
	player.velocity.y = -GameManager.JUMP_FORCE
	

func exit() -> void:
	pass
	
	
func update(delta: float) -> void:
	pass

 
func physics_update(delta: float) -> void:
	var axis_x = Input.get_axis("run_left", "run_right")
	var axis_y = Input.get_axis("jump", "crouch")
	player.velocity.x = GameManager.SPEED * delta * axis_x
	if axis_y == 1.0 and Input.is_action_just_pressed("attack"):
		transition.emit(self, "PlayerHelmBreakerFall")
		
	if player.velocity.y > 0.0:
		transition.emit(self, "PlayerFall")
