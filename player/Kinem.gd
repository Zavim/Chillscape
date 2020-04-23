extends KinematicBody

export var gravity = Vector3.DOWN *12
export var speed = 4
export var jump_speed = 6

var velocity = Vector3()

func _physics_process(delta):
    velocity += gravity*delta
    get_input()
    velocity = move_and_slide(velocity, Vector3.UP)

func get_input():
	velocity.x =0
	velocity.z = 0
	if Input.is_action_pressed("down"):
		velocity.z -=speed
	if Input.is_action_pressed("up"):
		velocity.z +=speed
	if Input.is_action_pressed("right"):
		velocity.x +=speed
	if Input.is_action_pressed("left"):
		velocity.x -=speed
