extends CharacterBody2D



func _ready() -> void:
	pass


func _process(delta: float) -> void:
	position.y = 582.0
	if Input.is_action_pressed("ui_left"):
		position.x -= 4
	if Input.is_action_pressed("ui_right"):
		position.x += 4
	move_and_slide()
