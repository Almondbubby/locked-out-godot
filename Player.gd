extends KinematicBody2D

var velo = Vector2.ZERO

var hasShovel = false
var hasBone = false

var canPickShovel = false


func _ready():
	hasShovel = false
	hasBone = false
	canPickShovel = false
	$Shovel.hide()

export var speed = 200

func _physics_process(delta):
	velo = Vector2.ZERO
	if(Input.is_action_pressed("forwards")):
		velo.y -= speed
		if(Input.is_action_pressed("left")):
			$AnimatedSprite.play("Left")
		elif(Input.is_action_pressed("right")):
			$AnimatedSprite.play("Right")
		else:
			$AnimatedSprite.play("Forwards")
	if(Input.is_action_pressed("back")):
		velo.y += speed
		if(Input.is_action_pressed("left")):
			$AnimatedSprite.play("Left")
		elif(Input.is_action_pressed("right")):
			$AnimatedSprite.play("Right")
		else:
			$AnimatedSprite.play("Back")
	if(Input.is_action_pressed("left")):
		velo.x -= speed
		$AnimatedSprite.play("Left")
	if(Input.is_action_pressed("right")):
		velo.x += speed
		$AnimatedSprite.play("Right")
	move_and_slide(velo)


func _process(delta):
	if Input.is_action_just_pressed("E") && canPickShovel:
		hasShovel = true

func showShovel(var show):
	if show:
		$Shovel.show()
		canPickShovel = true
	else:
		$Shovel.hide()
		
func getBone(var show):
	if show && hasShovel:
		$Shovel.show()
	else:
		$Shovel.hide()

