extends CharacterBody2D

const SPEED = 1000
const MAX_DIST = 400 # Maximum travel distance

var dist_traveled = 0
var mouse_pos = null
var start_pos = null

func set_mouse_pos(pos):
	# pos should be global
	mouse_pos = pos

func set_start_pos(pos):
	# pos should be local
	position = pos
	start_pos = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if mouse_pos and start_pos:
		var direction = (mouse_pos - position).normalized()
		
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
		
		move_and_slide()
		
		var distance = position.distance_to(start_pos)
		var dist_to_target = position.distance_to(mouse_pos)
		# If MAX DIST reached without colliding with an enemy
		# or target position reached,
		# delete potion
		if distance > MAX_DIST or dist_to_target < 10:
			queue_free()
