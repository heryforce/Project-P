extends CharacterBody2D

class_name Player

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

var _can_jump: bool = true
var _ignore_gravity: bool = false
@export var _pv: int = 100
@export var _mana: int = 100
@export var _power: int = 10

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if is_on_floor() == false:
		setCanJump(false)
		if getIgnoreGravity() == false:
			velocity.y += GameManager.GRAVITY * delta
	else:
		setCanJump(true)
	move_and_slide()

func setCanJump(value: bool) -> void:
	_can_jump = value

func canJump() -> bool:
	return _can_jump

func getIgnoreGravity() -> bool:
	return _ignore_gravity

func getPv() -> int:
	return _pv

func setPv(pv: int) -> void:
	_pv = pv

func getPower() -> int:
	return _power