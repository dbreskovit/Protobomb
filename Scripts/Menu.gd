extends Control


func _ready():
	MusicController.play_music("msc_menu")

func _on_startBtn_pressed():
	MusicController.stop_music("msc_menu")
	var _move = get_tree().change_scene("res://Scenes/Jogo.tscn")
	MusicController.play_sfx("shortCircuit")
	
func _on_quitBtn_pressed():
	get_tree().quit()


func _on_startBtn_mouse_entered():
	MusicController.play_sfx("sfx_componentUnclick")

func _on_quitBtn_mouse_entered():
	MusicController.play_sfx("sfx_componentUnclick")
