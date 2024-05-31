extends CharacterBody2D

const SPEED = 100.0

@onready var player = get_parent().get_parent().get_node('Player')

var is_ally = false

# Movement
func _physics_process(_delta):
	if not is_ally:
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

func _on_potion_hitbox_become_ally():
	is_ally = true
