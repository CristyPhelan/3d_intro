extends KinematicBody

var gravity = Vector3.DOWN * 20
var speed = 8.0
var jump_speed = 10.0
var spin_speed = 0.2

var velocity = Vector3.ZERO

func _physics_process(delta):
	velocity += gravity * delta
	var vy = velocity.y
	velocity = Vector3.ZERO
	var vz = Input.get_axis("forward", "back")
	velocity += transform.basis.z * vz * speed
	var vx = Input.get_axis("left", "right")
	velocity += transform.basis.x * vx * speed
	
	velocity.y = vy
	velocity = move_and_slide(velocity, Vector3.UP)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-lerp(0, spin_speed, 
			event.relative.x / 20))
