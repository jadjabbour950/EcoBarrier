extends Node2D

@export var DataFile: FileDialog
@export var Enemies: PackedScene
var TimeChange = 0.30
var Score = 0

signal EnemySpawned(GameScenePos, Enemy, Barrier)

# Called when the node enters the scene tree for the first time.
func _ready():
	AutoPlay.PlayMusic()
	
	var timer = get_node("Timer")
	timer.connect("timeout", on_Timer_timeout, 0)
	
	var File = FileAccess.open("DataFile", FileAccess.READ)
	
	get_node("HighScore/Score").text = File.get_as_text()
	
	File.close()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("PointsTag/Points").text = str(Score)
	
	pass

func on_Timer_timeout():
	get_node("Barrier").Speed += 0.05
	
	var EnemyLocation = $EnemyPath/PathFollow2D
	EnemyLocation.progress_ratio = randf()
	var Enemy = Enemies.instantiate()
	add_child(Enemy, false, Node.INTERNAL_MODE_DISABLED)
	
	Enemy.get_node("Meteor").position = EnemyLocation.position
	Enemy.position = Vector2(0, 0)
	
	emit_signal("EnemySpawned", position, Enemy, get_node("Barrier"))
	
	if get_node("Timer").wait_time - TimeChange > 1.75:
		get_node("Timer").wait_time -= TimeChange


func _on_star_timer_timeout():
	var YPos = randi_range(-324, 324)
	var Star = get_node("Star").duplicate()
	add_child(Star, false, Node.INTERNAL_MODE_DISABLED)
	
	Star.position.y = YPos
	Star.StartMoving = true
	
	get_node("StarTimer").wait_time = randi_range(2, 4)
	
	pass # Replace with function body.
