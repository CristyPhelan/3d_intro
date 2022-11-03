extends KinematicBody

export var gravity = Vector3.DOWN * 20
export var speed = 8.0
export var jump_speed = 8.0
export var mouse_sensitivity = 0.002

var velocity = Vector3.ZERO

func _physics_process(delta):
	velocity += gravity * delta
	var vy = velocity.y
	var input = Input.get_vector("left", "right", "forward", "back")
	input = Vector3(input.x, 0, input.y)
	velocity = transform.basis.xform(input) * speed
	velocity.y = vy
	
	velocity = move_and_slide(velocity, Vector3.UP)
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed

func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$CameraPivot.rotate_x(-event.relative.y * mouse_sensitivity)
		$CameraPivot.rotation.x = clamp($CameraPivot.rotation.x, -1.2, 1.2)
