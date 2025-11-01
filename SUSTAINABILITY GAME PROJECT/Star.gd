extends Area2D
var StartMoving = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if StartMoving == true:
		position.x += 0.5
	if position.x > 576:
		queue_free()
	
	pass
