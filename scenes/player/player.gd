extends CharacterBody2D

class_name Player

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

var can_jump: bool = true
var ignore_gravity: bool = false
var pv: int = 100
var mana: int = 100

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if is_on_floor() == false:
		can_jump = false
		if ignore_gravity == false:
			velocity.y += GameManager.GRAVITY * delta
	else:
		can_jump = true
	move_and_slide()
