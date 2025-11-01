extends CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var direction = 0
	direction = Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		rotation += 10 * delta
		position += Vector2(1, 0).rotated(rotation) * delta
	elif direction < 0:
		rotation -= 10 * delta
		position += Vector2(-1, 0).rotated(rotation) * delta
	

	move_and_slide()
