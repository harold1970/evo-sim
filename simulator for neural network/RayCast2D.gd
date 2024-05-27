extends RayCast2D

var line : Line2D

func _ready():
	# Configure the RayCast2D node
	target_position = Vector2(0, -100)  # Cast downwards along the Y-axis
	collision_mask = 1  # Set collision layer to interact with layer 1

	# Get the Line2D node
	line = $rtx

func _process(delta):
	# Cast the ray
	if is_colliding():
		# A collision was detected
		var collision_point = get_collision_point()
		var collided_object = get_collider()
		print("Collision detected with object:", collided_object, "at point:", collision_point)

		# Update the line to show the raycast
		line.points = [Vector2(0, 0), collision_point]
	else:
		# No collision detected, set the line length to the maximum
		line.points = [Vector2(0, 0),target_position]
