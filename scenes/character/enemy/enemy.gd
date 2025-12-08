extends Character

class_name Enemy


func _ready() -> void:
    pass

func _physics_process(delta: float) -> void:
    move_and_slide()