extends Character

class_name Player

var _can_jump: bool = true
var _ignore_gravity: bool = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if is_on_floor():
		setCanJump(true)
	else:
		setCanJump(false)
	var axis_x = Input.get_axis("run_left", "run_right")
	if axis_x > 0.0:
		anim_sprite.flip_h = false
	elif axis_x < 0.0:
		anim_sprite.flip_h = true
	
func _physics_process(delta: float) -> void:
	if get_ignore_gravity() == false:
		velocity.y += GameManager.GRAVITY * delta
	move_and_slide()

func setCanJump(value: bool) -> void:
	_can_jump = value

func canJump() -> bool:
	return _can_jump

func get_ignore_gravity() -> bool:
	return _ignore_gravity

func set_ignore_gravity(value: bool) -> void:
	_ignore_gravity = value
