extends CharacterBody2D

class_name Enemy

@export var _move_speed: float
var turn: int = 1


func _ready() -> void:
    pass

func _physics_process(delta: float) -> void:
    move_and_slide()

func move_right() -> void:
    var anim_sprite: AnimatedSprite2D = get_node("./AnimatedSprite2D")
    anim_sprite.flip_h = false
    turn = 1
    move()
    pass

func move_left() -> void:
    var anim_sprite: AnimatedSprite2D = get_node("./AnimatedSprite2D")
    anim_sprite.flip_h = true
    turn = -1
    move()
    pass

func move() -> void:
    var delta: float = get_process_delta_time()
    velocity.x = _move_speed * delta * turn
    pass

func stop_v() -> void:
    velocity.x = 0.0