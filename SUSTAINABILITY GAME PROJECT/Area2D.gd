extends Area2D
var direction = randi_range(0, 1)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if direction == 0:
		rotation += -0.01
	if direction == 1:
		rotation += 0.01
	
	pass
