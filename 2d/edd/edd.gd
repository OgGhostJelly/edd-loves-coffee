extends Area2D


@export var frames: Array[CompressedTexture2D]
@onready var sprite: Sprite2D = $Sprite2D



func _ready() -> void:
	frames.reverse()
	var _t = CoffeeManager.energy_changed.connect(_on_coffee_energy_changed)


func _on_coffee_energy_changed() -> void:
	var frame_index: int = floor(CoffeeManager.energy / ( CoffeeManager.max_energy / frames.size() ))
	frame_index = clamp(frame_index, 0, frames.size()-1)
	sprite.texture = frames[frame_index]


func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group('drinks'):
		return
	
	body.drink()
