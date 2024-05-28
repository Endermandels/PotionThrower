extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	var x_direction = Input.get_axis("ui_left", "ui_right")
	var y_direction = Input.get_axis('ui_up', 'ui_down')
	if x_direction:
		velocity.x = x_direction * SPEED
		velocity.y = y_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
