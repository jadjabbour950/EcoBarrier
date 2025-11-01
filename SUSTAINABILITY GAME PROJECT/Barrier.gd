extends Area2D
var Speed = 0.9

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = 0
	direction = Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		rotation += 2 * Speed * delta
	elif direction < 0:
		rotation -= 2 * Speed * delta
	
	pass


func _on_game_scene_enemy_spawned(GameScenePos, Enemy, Barrier):
	
	
	pass # Replace with function body.
