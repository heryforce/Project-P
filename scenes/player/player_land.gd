extends State

class_name PlayerLand

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: Player = $"../.."


func enter() -> void:
	anim_sprite.play("land")
	# use this only when falling from big heights
	anim_sprite.animation_finished.connect(on_anim_finished)
	

func exit() -> void:
	anim_sprite.animation_finished.disconnect(on_anim_finished)
	pass
	
	
func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	var axis_x = Input.get_axis("run_left", "run_right")
	if axis_x != 0.0:
		transition.emit(self, "PlayerRun")
	if Input.is_action_just_pressed("attack"):
		transition.emit(self, "PlayerAttack")
	if Input.is_action_just_pressed("jump"):
		transition.emit(self, "PlayerJump")


func on_anim_finished() -> void:
	transition.emit(self, "PlayerIdle")
