extends CharacterBody2D
var r =RandomNumberGenerator.new()
var speed = 400
func _ready() -> void:
	velocity = Vector2(-100, -100).normalized() * speed
 


func _process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		var bounced = velocity.bounce(collision.get_normal())
		if abs(collision.get_normal().y) > 0.9 or abs(collision.get_normal().x) > 0.9:
			bounced = bounced.rotated(randf_range(-0.5, 0.5))
		velocity = bounced.normalized() * velocity.length()
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Plat":
		$"..".points += 1
		speed += 20
		velocity = Vector2(velocity.x, velocity.y).normalized() * speed
