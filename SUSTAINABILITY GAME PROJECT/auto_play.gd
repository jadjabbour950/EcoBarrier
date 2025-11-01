extends AudioStreamPlayer2D
var music

# Called when the node enters the scene tree for the first time.
func _ready():
	music = preload("res://Among_Us_Menu_Music-639824.wav")
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	pass

func PlayMusic():
	play()
	
	pass
