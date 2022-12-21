extends Button


@export var scene_to_change_to: PackedScene = preload("res://main.tscn")


func _on_pressed() -> void:
	CoffeeManager.start_game()
	var _t = get_tree().change_scene_to_packed(scene_to_change_to)
