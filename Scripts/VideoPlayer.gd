extends VideoPlayer

func _process(_delta):
	if !$".".is_playing():
		var _move = get_tree().change_scene("res://Scenes/Perdeu.tscn")
