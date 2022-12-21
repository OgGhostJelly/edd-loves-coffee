extends Button


func _on_pressed() -> void:
	CoffeeManager.start_game()
	var _t = get_tree().reload_current_scene()
	get_tree().paused = false
