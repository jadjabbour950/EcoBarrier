extends Area2D
var Init = false
@export var direction: int
@export var speed: int
var TargetPos = Vector2(0, 0)

signal Barrier_Touched()
signal Go_To_Menu()

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	direction = randi_range(0, 1)
	speed = randi_range(55, 90)
	get_node("AnimatedSprite2D").frame = randi_range(0, 3)
	
	get_parent().get_parent().get_node("Barrier").connect("area_entered", on_barrier_touched, 0)
	get_parent().get_parent().get_node("Earth").connect("area_entered", on_earth_touched, 0)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position.move_toward(TargetPos, delta * speed)
	
	if direction == 0:
		rotation += -0.03
	if direction == 1:
		rotation += 0.03
	
	pass


func _on_game_scene_enemy_spawned(GameScenePos, Enemy, Barrier):
	TargetPos = GameScenePos
	
	pass

func on_barrier_touched(area):
	call_deferred("emit_signal", "Barrier_Touched")
	
	'''var Explosion = get_parent().get_parent().get_node("Explosion").duplicate()
	get_parent().add_child(Explosion, true, Node.INTERNAL_MODE_DISABLED)
	Explosion.position = position
	Explosion.Start = true'''
	
	area.queue_free()
	
	get_parent().get_parent().Score += 1
	get_parent().get_parent().get_node("MeteorCollide").play(0.0)
	pass

func on_earth_touched(area):
	#call_deferred("emit_signal", "Go_To_Menu")
	emit_signal("Go_To_Menu")
	
	pass
