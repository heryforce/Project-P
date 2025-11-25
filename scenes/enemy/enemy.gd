extends CharacterBody2D

class_name Enemy

var _pv: int = 100

signal sig_hurt

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	move_and_slide()


func getPv() -> int:
	return _pv

func setPv(pv: int) -> void:
	_pv = pv

func hurt(power: int) -> void:
	setPv(getPv() - power)
	sig_hurt.emit()
