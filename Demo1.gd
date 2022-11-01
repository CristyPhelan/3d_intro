extends Spatial

func _process(delta):
	$Camera.look_at($Player.transform.origin,
		Vector3.UP)
