extends CharacterBody2D

const SPEED = 300

var mouse_pos = null

func set_mouse_pos(pos):
	mouse_pos = pos

func set_start_pos(pos):
	position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if mouse_pos:
		var direction = (mouse_pos - position).normalized()
		
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
		
		move_and_slide()
