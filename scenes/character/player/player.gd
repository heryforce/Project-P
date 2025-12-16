extends Character

class_name Player

var _ignore_gravity: bool = false
var _jump_charge: int

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if is_on_wall() and !is_on_floor():
		set_jump_charge(1)

	var axis_x = Input.get_axis("run_left", "run_right")
	if axis_x > 0.0:
		anim_sprite.flip_h = false
	elif axis_x < 0.0:
		anim_sprite.flip_h = true
	
func _physics_process(delta: float) -> void:
	if get_ignore_gravity() == false:
		velocity.y += GameManager.GRAVITY * delta
	move_and_slide()

func get_ignore_gravity() -> bool:
	return _ignore_gravity

func set_ignore_gravity(value: bool) -> void:
	_ignore_gravity = value

func set_jump_charge(jump_charge: int) -> void:
	_jump_charge = jump_charge

func get_jump_charge() -> int:
	return _jump_charge