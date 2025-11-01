extends Node2D
var StartMenu = false
@export var DataFile: FileDialog
var Score
# Called when the node enters the scene tree for the first time.
func _ready():
	Score = get_parent().Score
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if StartMenu == true:
		get_tree().change_scene_to_file("res://MenuScene.tscn")
	
	pass

func _on_meteor_go_to_menu():
	var File = FileAccess.open("DataFile", FileAccess.READ_WRITE)
	
	if Score > int(File.get_as_text()):
		File.store_line(str(Score))
	
	File.close()
	
	StartMenu = true
	pass # Replace with function body.


func _on_meteor_barrier_touched():
	
	
	pass # Replace with function body.
