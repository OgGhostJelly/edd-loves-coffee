extends RigidBody2D


@export var speed: float = 100.0


func _ready() -> void:
	rotate(randf_range(-PI,PI))


func drag() -> void:
	apply_torque_impulse(PI * 2)
	apply_central_impulse(global_position.direction_to(get_global_mouse_position()) * speed)


func drink() -> void:
	CoffeeManager.drink_coffee()
	
	queue_free()
