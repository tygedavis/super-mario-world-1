extends Node2D

const GREEN_MUSHROOM = "green_mushroom"
const RED_MUSHROOM = "red_mushroom"
const FIRE_FLOWER = "fire_flower"
const STAR = "star"
const items = [GREEN_MUSHROOM, RED_MUSHROOM, FIRE_FLOWER, STAR]
var item
const ENABLED = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Determine which random object to display
	item = items.pick_random()
	print("Random item is: ", item)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bottom_detector_body_entered(body: Node2D) -> void:
	print("The mystery box has been entered")
	# Move the box up and down
	position.y-=10
	await get_tree().create_timer(.09).timeout
	position.y+=10
	
	# Spawn the random item
	
	# Disable Mystery Box
