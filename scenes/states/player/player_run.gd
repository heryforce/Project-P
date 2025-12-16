extends State

class_name PlayerRun

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."

func _ready() -> void:
	player.sig_hurt.connect(on_sig_hurt)

func enter() -> void:
	player.set_jump_charge(2)
	anim_sprite.play("run_first_frame")
	anim_sprite.play("run")


func exit() -> void:
	pass
	
	
func update(delta: float) -> void:
	if Input.is_action_just_pressed("jump") and player.get_jump_charge() > 0:
		transition.emit(self, "PlayerJump")

	if Input.is_action_just_pressed("attack"):
		transition.emit(self, "PlayerAttack")
	pass


func physics_update(delta: float) -> void:
	var axis_x = Input.get_axis("run_left", "run_right")
	player.velocity.x = player.getMoveSpeed() * delta * axis_x
	if axis_x == 0.0:
		transition.emit(self, "Idle")

func on_sig_hurt() -> void:
	transition.emit(self, "PlayerHurt")