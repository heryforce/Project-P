extends Enemy

class_name Clone

@export var _pv: int = 100
@onready var rays: Node2D = $Raycasting

signal sig_hurt
signal sig_chase

# func _ready() -> void:
# 	print("hola chica")
# 	pass


func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	for ray in rays.get_children():
		if (ray.get_collider() is Player):
			sig_chase.emit()
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
