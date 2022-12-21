extends ColorRect


func _ready() -> void:
	var _t = CoffeeManager.game_ended.connect(func(): visible = true)
