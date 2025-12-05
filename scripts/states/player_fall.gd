extends State

class_name PlayerFall

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."


func enter() -> void:
	anim_sprite.play("fall")
	player.setIgnoreGravity(false)
	

func exit() -> void:
	pass
	
	
func update(delta: float) -> void:
	pass

 
func physics_update(delta: float) -> void:
	var axis_x = Input.get_axis("run_left", "run_right")
	var axis_y = Input.get_axis("jump", "crouch")

	player.velocity.x = player.getMoveSpeed() * delta * axis_x
	# if axis_y == 1.0 and Input.is_action_just_pressed("attack"):
	# 	transition.emit(self, "PlayerHelmBreakerFall")
	
	if Input.is_action_just_pressed("attack"):
		transition.emit(self, "PlayerAttack")

	if player.is_on_floor():
		if player.velocity.x == 0.0:
			transition.emit(self, "PlayerLand")
		else:
			transition.emit(self, "PlayerRun")
