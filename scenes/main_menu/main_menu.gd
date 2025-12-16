extends Control

func _ready() -> void:
	pass

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

func _on_new_game_button_pressed() :
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")
	
func _on_load_game_button_pressed() :
	print("Chargement de la partie...")

func _on_options_button_pressed() :
	print("Options...")

func _on_quit_button_pressed() :
	get_tree().quit()
