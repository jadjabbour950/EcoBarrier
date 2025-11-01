extends Sprite2D
var Start = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Start == true:
		rotation += 0.02
		scale += Vector2(0.005, 0.005)
		modulate -= Color(0, 0, 0, 0.02)
	
	if modulate == Color(0, 0, 0, 0):
		queue_free()
	
	pass
