extends Control


@onready var energy_bar: ProgressBar = $Container/Energy
@onready var score_label: Label = $Container/Score


func _ready() -> void:
	var _t = CoffeeManager.energy_changed.connect(_on_coffee_energy_changed)
	_t = CoffeeManager.score_changed.connect(_on_coffee_score_changed)
	
	_on_coffee_energy_changed()
	_on_coffee_score_changed()


func _on_coffee_energy_changed() -> void: energy_bar.value = CoffeeManager.energy
func _on_coffee_score_changed() -> void: score_label.text = 'Score: %s' % round(CoffeeManager.score)

