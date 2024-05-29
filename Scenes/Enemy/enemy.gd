extends CharacterBody2D

const SPEED = 100.0

@onready var player = get_parent().get_parent().get_node('Player')

func _physics_process(_delta):
	var direction = (player.position - position).normalized()
	
	
	if direction.x:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction.y:
		velocity.y = direction.y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
