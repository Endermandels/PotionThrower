extends CharacterBody2D

@onready var potion_scene = preload('res://Scenes/Potion/potion.tscn')

@onready var world_scene = get_parent()

const SPEED = 300.0

func _input(event):
	# When clicked, spawn new potion which goes to clicked position
	if event is InputEventMouseButton and event.button_index == 1:
		if event.pressed:
			var new_potion = potion_scene.instantiate()
			new_potion.set_mouse_pos(get_viewport().get_mouse_position())
			new_potion.set_start_pos(position)
			world_scene.add_child(new_potion)

func _physics_process(_delta):
	var x_direction = Input.get_axis('ui_left', 'ui_right')
	var y_direction = Input.get_axis('ui_up', 'ui_down')
	
	# Move if input, otherwise slow down
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Move if input, otherwise slow down
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
