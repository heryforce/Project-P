extends State

class_name PlayerIdle

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."

func enter() -> void:
	anim_sprite.play("idle")

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	#var dir = Input.get_vector("run_left", "run_right", "jump","crouch")
	var axis = Input.get_axis("run_left", "run_right")
	if Input.is_action_just_pressed("jump"):
		if player.can_jump:
			transition.emit(self, "PlayerJump")
	if Input.is_action_just_pressed("attack"):
		transition.emit(self, "PlayerAttack")
	if axis != 0.0:
		transition.emit(self, "PlayerRun")

func physics_update(delta: float) -> void:
	pass
