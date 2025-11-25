extends State

class_name PlayerRun

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."

func enter() -> void:
	anim_sprite.play("run_first_frame")
	anim_sprite.play("run")


func exit() -> void:
	pass
	
	
func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	var axis_x = Input.get_axis("run_left", "run_right")
	player.velocity.x = GameManager.SPEED * delta * axis_x
	if axis_x == 0.0:
		transition.emit(self, "Idle")
	else:
		if axis_x > 0.0:
			anim_sprite.flip_h = false
		else:
			anim_sprite.flip_h = true

	if Input.is_action_just_pressed("jump"):
		transition.emit(self, "PlayerJump")
	if Input.is_action_just_pressed("attack"):
		player.velocity.x = 0.0
		transition.emit(self, "PlayerAttack")
