extends State

class_name PlayerJump

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."

func _ready() -> void:
	player.sig_hurt.connect(on_sig_hurt)

func enter() -> void:
	player.set_jump_charge(player.get_jump_charge() - 1)
	player.set_ignore_gravity(true)
	anim_sprite.play("jump")
	
	if player.is_on_wall() and !player.is_on_floor():
		player.set_jump_charge(1)
	

func exit() -> void:
	pass
	
	
func update(delta: float) -> void:
	if Input.is_action_just_pressed("jump") and player.get_jump_charge() > 0:
		transition.emit(self, "PlayerJump")

	if Input.is_action_just_pressed("attack"):
		player.set_ignore_gravity(false)
		transition.emit(self, "PlayerAttack")
	pass

 
func physics_update(delta: float) -> void:
	var axis_x = Input.get_axis("run_left", "run_right")
	# var axis_y = Input.get_axis("jump", "crouch")
	if Input.is_action_pressed("jump") and player.velocity.y > GameManager.MAX_JUMP_FORCE and player.get_ignore_gravity() == true:
		player.velocity.y -= 50.0
	else:
		player.set_ignore_gravity(false)
	player.velocity.x = player.getMoveSpeed() * delta * axis_x
	# if axis_y == 1.0 and Input.is_action_just_pressed("attack"):
	# 	transition.emit(self, "PlayerHelmBreakerFall")
		
	if player.velocity.y > 0.0 and player.get_ignore_gravity() == false:
		transition.emit(self, "PlayerFall")

func on_sig_hurt() -> void:
	transition.emit(self, "PlayerHurt")