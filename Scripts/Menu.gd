extends Control


func _ready():
	MusicController.play_music("msc_menu")

func _on_startBtn_pressed():
	MusicController.stop_music("msc_menu")
	var _move = get_tree().change_scene("res://Scenes/Jogo.tscn")
	
func _on_quitBtn_pressed():
	get_tree().quit()
