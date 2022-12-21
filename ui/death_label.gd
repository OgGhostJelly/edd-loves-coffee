extends Label


func _ready() -> void:
	var _t = CoffeeManager.game_ended.connect(func():
		if CoffeeManager.score <= 10:
			text = 'Edd died of lack of caffeine'
		elif CoffeeManager.score >= 1000:
			text = 'Edd under your bed'
		elif CoffeeManager.score >= 500:
			text = 'touch grass :skull:'
		elif CoffeeManager.score >= 100:
			text = 'Edd died of caffeine overdose'
		else:
			text = 'Edd is literally dead'
		)
