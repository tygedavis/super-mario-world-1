extends Node2D

#const GREEN_MUSHROOM = "green_mushroom"
@onready var red_mushroom_scene = preload("res://Resources/Items/Red_Mushroom.tscn")
@onready var fire_flower_scene = preload("res://Resources/Items/Fire_Flower.tscn")
@onready var star_scene = preload("res://Resources/Items/Star.tscn")
@onready var items = [red_mushroom_scene, red_mushroom_scene, star_scene]
@onready var item_scene
var ENABLED = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Determine which random object to display
	item_scene = items.pick_random()
	print("Random item is: ", item_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_bottom_detector_body_entered(_body: Node2D) -> void:
	print("The mystery box has been entered")
	if ENABLED:
		# Move the box up and down
		position.y-=10
		await get_tree().create_timer(.09).timeout
		position.y+=10
		
		# Spawn the random item
		var item_instance = item_scene.instantiate()
		print("Global position is: ", global_position)
		print("Item Instance is: ", item_instance)
		item_instance.position = Vector2(0, -20)
		add_child(item_instance)
		
		# Disable Mystery Box
		ENABLED = false
		$ColorRect.visible = true
