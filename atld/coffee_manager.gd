extends Node


signal energy_changed
signal score_changed
signal game_ended
signal game_started
signal coffee_spawned


@export var score: float = 25.0: set = _on_score_changed
@export var score_increase: float = 5.0

@export var max_energy: float = 100.0
@export var energy_increase: float = 10.0
@export var energy_decrease: float = 10.0

var energy: float = 0.0: set = _on_energy_changed
var game_state: bool = false: set = _on_game_state_changed



# decrease energy every frame
func _process(delta: float) -> void:
	if game_state:
		energy -= energy_decrease * delta
		if energy <= 0: end_game(); game_ended.emit(); get_tree().paused = true
# increase energy when coffee drunk
func drink_coffee(): energy += energy_increase; score += score_increase
# start game on game start
func start_game(): game_state = true; energy = max_energy; score = 25.0
# end game on game end
func end_game(): game_state = false
# spawn coffe on coffe spawn
func spawn_coffee(): coffee_spawned.emit()


func _on_energy_changed(value: float) -> void:
	energy = value
	energy = clamp(energy, 0, max_energy)
	
	energy_changed.emit()


func _on_score_changed(value: float) -> void:
	score = value
	
	score_changed.emit()


func _on_game_state_changed(value: bool) -> void:
	game_state = value
	if game_state:
		game_started.emit()
	else:
		game_ended.emit()
