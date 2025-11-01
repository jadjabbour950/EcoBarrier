extends AnimatedSprite2D

@export var Path : int
@export var direction: int
@export var speed: int
var StartMoving = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	Path = randi_range(0, 1)
	direction = randi_range(0, 1)
	speed = randi_range(55, 90)
	frame = randi_range(0, 3)
	
	if Path == 0:
		position.x = -576
	if Path == 1:
		position.x = 576
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if direction == 0:
		rotation += -0.03
	if direction == 1:
		rotation += 0.03
	
	if Path == 0:
		position += Vector2(0.02, 0) * speed
	if Path == 1:
		position += Vector2(-0.02, 0) * speed
	
	pass
