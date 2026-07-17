extends CharacterBody2D


var SPEED = 100.0
#const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	velocity.x = SPEED

	move_and_slide()


func _on_collision_sides_body_entered(_body: Node2D) -> void:
	SPEED = SPEED * -1
	

func collect():
	pass
