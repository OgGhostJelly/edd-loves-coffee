extends Node


var drag_button_down: bool = false
var draggable_mouse_on: RigidBody2D
var draggable_dragging: RigidBody2D


func _process(_delta: float) -> void:
	for o in get_tree().get_nodes_in_group('draggables') as Array[RigidBody2D]:
		o.input_pickable = true
		var _t
		if not o.mouse_entered.is_connected(_on_draggable_mouse_entered):
			_t = o.mouse_entered.connect(_on_draggable_mouse_entered.bind(o))
		if not o.mouse_exited.is_connected(_on_draggable_mouse_exited):
			_t = o.mouse_exited.connect(_on_draggable_mouse_exited)


func _input(event: InputEvent) -> void:
	if not event is InputEventMouseButton:
		return
	
	drag_button_down = event.is_pressed()


func _physics_process(_delta: float) -> void:
	if drag_button_down and draggable_mouse_on and not is_instance_valid(draggable_dragging):
		draggable_dragging = draggable_mouse_on
	elif not drag_button_down:
		draggable_dragging = null
	
	if is_instance_valid(draggable_dragging):
		draggable_dragging.drag()


func _on_draggable_mouse_entered(draggable: RigidBody2D) -> void: draggable_mouse_on = draggable
func _on_draggable_mouse_exited() -> void: draggable_mouse_on = null
