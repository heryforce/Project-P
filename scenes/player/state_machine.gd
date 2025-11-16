extends Node

class_name StateMachine

var states: Dictionary = {}
var current_state: State

@export var initial_state: State

func _ready() -> void:
	initial_state = $PlayerIdle
	for child in get_children():
		if child is State:
			#pour chaque State de ma FSM, je les push dans mon hash et je connecte au signal pour détecter les changements d'état
			states[child.name.to_lower()] = child
			child.transition.connect(on_transition)
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _process(delta: float) -> void:
	current_state.update(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)

func on_transition(old_state: State, new_state_name: String) -> void:
	# l'état qui appelle cette fonction doit être l'état actuel
	if old_state != current_state:
		return

	var new_state: State = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.exit()

	new_state.enter()
	current_state = new_state
