extends Node2D

func _ready():
	pass
	
func play_sfx(sfx):
	get_node(sfx).play()
	
func play_music(msc):
	get_node(msc).play()

func stop_music(msc):
	get_node(msc).stop()
