extends State

class_name PlayerIdle

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."

func enter() -> void:
	anim_sprite.play("idle")

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	var axis = Input.get_axis("run_left", "run_right")
	if Input.is_action_just_pressed("jump"):
		if player.canJump():
			transition.emit(self, "PlayerJump")
	if Input.is_action_just_pressed("attack"):
		transition.emit(self, "PlayerAttack")
	if axis != 0.0:
		transition.emit(self, "PlayerRun")

func physics_update(delta: float) -> void:
	pass
