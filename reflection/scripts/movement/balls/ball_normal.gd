extends CharacterBody2D

var speed = 400
func _ready() -> void:
	velocity = Vector2(-100, -100).normalized() * speed
 


func _process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Plat":
		$"..".points += 1
		speed += 20
		velocity = Vector2(-100, -100).normalized() * speed
