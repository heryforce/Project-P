extends State

class_name EnemyChase

@onready var anim_sprite: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var enemy: Enemy = $"../.."
@onready var player: Player = $"../../../Player"
@onready var aggro_zone: Area2D = $"../../AggroZone"
@onready var range_zone: Area2D = $"../../RangeZone"

var player_pos: Vector2 = Vector2(0, 0)

func _ready():
	enemy.sig_hurt.connect(on_sig_hurt)
	aggro_zone.connect("body_exited", on_body_exited)
	range_zone.connect("body_entered", on_in_range)
	pass

func enter() -> void:
	pass

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	player_pos = player.position
	pass

func physics_update(delta: float) -> void:
	if player_pos.x >= enemy.position.x:
		anim_sprite.flip_h = false
		enemy.move_right()
	else:
		anim_sprite.flip_h = true
		enemy.move_left()
	pass

func on_body_exited(body) -> void:
	if body is Player:
		print("player exited the aggro zone")
		transition.emit(self, "Wander")

func on_sig_hurt() -> void:
	transition.emit(self, "Hurt")

func on_in_range(body) -> void:
	# turn to player and transition to attack the player
	if body is Player:
		transition.emit(self, "Attack")
		print("IN RANGE TO ATTACK")
	pass
