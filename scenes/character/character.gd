extends CharacterBody2D

class_name Character

@export var _pv: int = 100
@export var _power: int = 10
@export var _move_speed: float
@export var _mana: int = 100

signal sig_hurt


@onready var anim_sprite: AnimatedSprite2D = get_node("./AnimatedSprite2D")

var turn: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass


func getPower() -> int:
	return _power

func setPower(value: int) -> void:
	_power = value


func getPv() -> int:
	return _pv

func setPv(pv: int) -> void:
	_pv = pv


func getMoveSpeed() -> float:
	return _move_speed

func setMoveSpeed(move_speed: float) -> void:
	_move_speed = move_speed


func move_right() -> void:
	turn = 1
	move()
	pass

func move_left() -> void:
	turn = -1
	move()
	pass

func move() -> void:
	var delta: float = get_process_delta_time()
	velocity.x = getMoveSpeed() * delta * turn
	anim_sprite.play("run")

	pass

func stop_v() -> void:
	velocity.x = 0.0


func hurt(power: int) -> void:
	setPv(getPv() - power)
	sig_hurt.emit()
