extends Node2D
var high = 0
var points = 0
@export var scene_transition: PackedScene



func _process(delta: float) -> void:
	$Menu/Score.text = "Score: " + str(points)
	$Menu/Score2.text = "High Score: " + str(high)


func _on_world_border_body_entered(body: Node2D) -> void:
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
