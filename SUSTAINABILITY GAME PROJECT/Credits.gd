extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$StarTimer.connect("timeout", on_startimer_timeout, 0)
	AutoPlay.PlayMusic()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_startimer_timeout():
	var YPos = randi_range(-324, 324)
	var Star = get_node("Star").duplicate()
	add_child(Star, false, Node.INTERNAL_MODE_DISABLED)
	
	Star.position.y = YPos
	Star.StartMoving = true
	
	get_node("StarTimer").wait_time = randi_range(2, 4)
	
	pass


func _on_back_pressed():
	get_tree().change_scene_to_file("res://MenuScene.tscn")
	
	pass # Replace with function body.
