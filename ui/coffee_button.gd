extends Button


@export var price: float = 2.0


func _on_pressed() -> void:
	if CoffeeManager.score >= price:
		CoffeeManager.spawn_coffee()
		CoffeeManager.score -= price
