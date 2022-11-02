extends Spatial

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
#func _process(delta):
#	$Camera.look_at($Player.transform.origin,
#		Vector3.UP)
