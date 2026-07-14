extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300
const GRAVITY = 200


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		#print("jump was just pressed")
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("sm_jump")


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Execute logic if player is not moving forward or backward
	if velocity.x == 0 && velocity.y == 0:
		#print("Animation `sm_stand` triggered...")
		$AnimatedSprite2D.play("sm_stand")
	elif velocity.x != 0 && velocity.y == 0:
		# print("Animation `sm_walk` triggered...")
		$AnimatedSprite2D.play("sm_walk")
		$AnimatedSprite2D.flip_h = velocity.x < 0

	move_and_slide()
