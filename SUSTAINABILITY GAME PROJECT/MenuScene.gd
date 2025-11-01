extends Node2D
var ScreenSize: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	ScreenSize = get_node("Camera2D").ScreenSize
	AutoPlay.PlayMusic()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://GameScene.tscn")
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	
	pass # Replace with function body.

func _on_timer_timeout():
	var YPos = randi_range(-324, 324)
	var Star = get_node("Star").duplicate()
	add_child(Star, false, Node.INTERNAL_MODE_DISABLED)
	
	Star.position.y = YPos
	Star.StartMoving = true
	
	get_node("StarTimer").wait_time = randi_range(2, 4)
	
	pass # Replace with function body.


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Credits.tscn")
	
	pass # Replace with function body.


func _on_about_pressed():
	get_tree().change_scene_to_file("res://About.tscn")
	
	pass # Replace with function body.


func _on_meteor_timer_timeout():
	var side = randi_range(0, 1)
	var YPos = randi_range(-324, 324)
	var Meteor = get_node("Meteor").duplicate()
	
	Meteor.position.y = YPos
	Meteor.StartMoving = true
	
	add_child(Meteor, true, Node.INTERNAL_MODE_DISABLED)
	get_node("MeteorTimer").wait_time = randi_range(15, 20)
	
	pass # Replace with function body.
