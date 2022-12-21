extends AudioStreamPlayer


func _ready() -> void:
	stream_paused = false
	var _t = CoffeeManager.game_started.connect(func(): stream_paused = false)
	_t = CoffeeManager.game_ended.connect(func(): stream_paused = true)
