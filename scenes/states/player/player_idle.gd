extends State

class_name PlayerIdle

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."

func _ready() -> void:
	player.sig_hurt.connect(on_sig_hurt)


func enter() -> void:
	anim_sprite.play("idle")

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	var axis = Input.get_axis("run_left", "run_right")
	if Input.is_action_just_pressed("jump"):
		transition.emit(self, "PlayerJump")
	if Input.is_action_just_pressed("attack"):
		transition.emit(self, "PlayerAttack")
	if axis != 0.0:
		transition.emit(self, "PlayerRun")

func physics_update(delta: float) -> void:
	pass

func on_sig_hurt() -> void:
	transition.emit(self, "PlayerHurt")
