extends CharacterBody2D

class_name Player

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

var _can_jump: bool = true
var _ignore_gravity: bool = false
@export var _pv: int = 100
@export var _mana: int = 100
@export var _power: int = 10
@export var _move_speed: float = 10000.0

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
	if getIgnoreGravity() == false:
		velocity.y += GameManager.GRAVITY * delta
	move_and_slide()

func setCanJump(value: bool) -> void:
	_can_jump = value

func canJump() -> bool:
	return _can_jump

func getIgnoreGravity() -> bool:
	return _ignore_gravity

func setIgnoreGravity(value: bool) -> void:
	_ignore_gravity = value

func getPv() -> int:
	return _pv

func setPv(pv: int) -> void:
	_pv = pv

func getPower() -> int:
	return _power

func setPower(value: int) -> void:
	_power = value

func getMoveSpeed() -> float:
	return _move_speed

func setMoveSpeed(move_speed: float) -> void:
	_move_speed = move_speed