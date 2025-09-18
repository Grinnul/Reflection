extends Node2D
var high = 0
var points = 0
var ready_ = false
@export var scene_transition: PackedScene

func _ready():
	match OS.get_name():
		"Android":
			$Joystick.show()
			ready_ = true
	if ready_ == true:
		$Menu/joystick.text = "Disable Joystick"
	else:
		$Menu/joystick.text = "Enable Joystick"
func _process(delta: float) -> void:
	$Menu/Score.text = "Score: " + str(points)
	$Menu/Score2.text = "High Score: " + str(high)


func _on_world_border_body_entered(body: Node2D) -> void:
	$GidGud.play()
	$CPUParticles2D.emitting = true
	if body.name == "Ball":
		$Ball.position = Vector2(587, 279)
		$Ball.speed = 400
		$Ball._ready()
		if points > high:
			high = points
		points = 0
	elif body.name == "Ball2":
		$Ball2.position = Vector2(587, 279)
		$Ball2.speed = 400
		$Ball2._ready()
		if points > high:
			high = points
		points = 0

func _on_scene_pressed() -> void:
	get_tree().change_scene_to_packed(scene_transition)


func _on_joystick_pressed() -> void:
	if ready_ == false:
		ready_ = true
		$Joystick.show()
		$Menu/joystick.text = "Disable Joystick"
	else:
		ready_ = false
		$Joystick.hide()
		$Menu/joystick.text = "Enable Joystick"


func _on_random_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/random.tscn")


func _on_normal_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/normal.tscn")
