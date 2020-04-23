extends KinematicBody
class_name Player

export var speed := 5.0
export var gravity := Vector3.DOWN *12
export var jump_speed := 12.0

var motion := Vector2()
var velocity := Vector3()
var jump = false

func cartesian_to_isometric(vector):
	return Vector2(vector.x - vector.y, vector.x + vector.y)

func _physics_process(delta : float) -> void: 	
	velocity += gravity * delta
	get_input()
	velocity = move_and_slide_with_snap(velocity, Vector3(0, velocity.y , 0), Vector3.UP, true)

func get_input():
	var vy = velocity.y
	velocity = Vector3()
	var direction := Vector2(
	Input.get_action_strength("right") - Input.get_action_strength("left"),
	Input.get_action_strength("down") - Input.get_action_strength("up"))

	motion = cartesian_to_isometric(direction).normalized()

	velocity = Vector3(
		motion.x * speed,
		velocity.y,
		motion.y * speed)
	velocity.y = vy

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
