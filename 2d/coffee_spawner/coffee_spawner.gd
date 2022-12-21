extends Node2D


@export var spawn: PackedScene = preload("res://2d/coffee/coffee.tscn")
@onready var spawn_path: PathFollow2D = $SpawnPath/SpawnPathFollow


func _ready() -> void:
	var _t = CoffeeManager.coffee_spawned.connect(_on_coffee_spawned)


func _on_coffee_spawned() -> void:
	var obj: Node2D = spawn.instantiate()
	spawn_path.progress_ratio = randf()
	obj.global_position = spawn_path.global_position
	add_child(obj)
