extends Enemy

class_name Clone

@onready var rays: Node2D = $Raycasting

signal sig_chase

func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	for ray in rays.get_children():
		if (ray.get_collider() is Player):
			sig_chase.emit()
	if is_on_floor() == false:
		velocity.y += GameManager.GRAVITY * delta
	move_and_slide()