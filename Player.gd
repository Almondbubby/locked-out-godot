extends KinematicBody2D

var velo = Vector2.ZERO

export var speed = 200

func _physics_process(delta):
	velo = Vector2.ZERO
	if(Input.is_action_pressed("forwards")):
		velo.y -= speed
		$AnimatedSprite.play("Forwards")
	if(Input.is_action_pressed("back")):
		velo.y += speed
		$AnimatedSprite.play("Back")
	if(Input.is_action_pressed("left")):
		velo.x -= speed
		$AnimatedSprite.play("Left")
	if(Input.is_action_pressed("right")):
		velo.x += speed
		$AnimatedSprite.play("Right")
	move_and_slide(velo)
