extends Label


func _process(_delta):
	$".".set_text(str(VariablesGlobal.time_passed))
		
	if VariablesGlobal.time_passed == "00:00":
		var _move = get_tree().change_scene("res://Scenes/GameOver.tscn")
		MusicController.stop_music("msc_game")
		MusicController.stop_sfx("sfx_clock")
		MusicController.stop_sfx("sfx_bulbBuzzTop")
	pass

func _ready():
	VariablesGlobal.cock = true
	MusicController.play_sfx("sfx_clock")
