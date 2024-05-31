extends Area2D

signal become_ally

# Potion collided
func _on_area_entered(area):
	emit_signal('become_ally')
