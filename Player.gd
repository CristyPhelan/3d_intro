extends KinematicBody

var gravity = Vector3.DOWN * 10
var speed = 8
var jump_speed = 6
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

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-lerp(0, spin_speed, 
			event.relative.x / 20))
