extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300
const GRAVITY = 200
var size = "sm"


func _physics_process(delta: float) -> void:
	var animation = ""
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		#print("jump was just pressed")
		velocity.y = JUMP_VELOCITY
		animation = size + "_jump"
		$AnimatedSprite2D.play(animation)


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
		animation = size + "_stand"
		$AnimatedSprite2D.play(animation)
	elif velocity.x != 0 && velocity.y == 0:
		# print("Animation `sm_walk` triggered...")
		animation = size + "_walk"
		$AnimatedSprite2D.play(animation)
		$AnimatedSprite2D.flip_h = velocity.x < 0

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("items"):
		body.collect(self)
		

func grow_big():
	size = "xl"
	pass
