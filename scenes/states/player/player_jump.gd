extends State

class_name PlayerJump

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."

func enter() -> void:
	if player.canJump():
		player.setIgnoreGravity(true)
		print("entering jump")
		anim_sprite.play("jump")
	

func exit() -> void:
	print("exit jump")
	pass
	
	
func update(delta: float) -> void:
	pass

 
func physics_update(delta: float) -> void:
	var axis_x = Input.get_axis("run_left", "run_right")
	var axis_y = Input.get_axis("jump", "crouch")
	if Input.is_action_pressed("jump") and player.velocity.y > GameManager.MAX_JUMP_FORCE and player.getIgnoreGravity() == true:
		print("flying")
		player.velocity.y -= 50.0
		print(player.velocity.y)
	else:
		player.setIgnoreGravity(false)
	player.velocity.x = player.getMoveSpeed() * delta * axis_x
	# if axis_y == 1.0 and Input.is_action_just_pressed("attack"):
	# 	transition.emit(self, "PlayerHelmBreakerFall")
		
	if player.velocity.y > 0.0 and player.getIgnoreGravity() == false:
		transition.emit(self, "PlayerFall")
	if Input.is_action_just_pressed("attack"):
		player.setIgnoreGravity(false)
		transition.emit(self, "PlayerAttack")