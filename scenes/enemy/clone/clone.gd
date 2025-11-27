extends Enemy

class_name Clone

@export var _pv: int = 100
@onready var aggro_zone: Area2D = $AggroZone

signal sig_hurt
signal sig_chase

func _ready() -> void:
	aggro_zone.connect("body_entered", on_body_entered)
	aggro_zone.connect("body_exited", on_body_exited)
	pass


func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if is_on_floor() == false:
		velocity.y += GameManager.GRAVITY * delta
	move_and_slide()


func getPv() -> int:
	return _pv

func setPv(pv: int) -> void:
	_pv = pv

func hurt(power: int) -> void:
	setPv(getPv() - power)
	sig_hurt.emit()

func on_body_entered(body) -> void:
	if body is Player:
		print("player entered the aggro zone")
		sig_chase.emit()
		#lancer l'état chase

func on_body_exited(body) -> void:
	if body is Player:
		print("player exited the aggro zone")