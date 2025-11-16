extends CharacterBody2D

class_name Enemy

@onready var hurtbox: Area2D = $Hurtbox

var pv: int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hurtbox.connect("area_entered", on_area_entered)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	move_and_slide()

func on_area_entered(area) -> void:
	if area is Hitbox:
		print("enemy hurt")
		
	pass
