extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_lampada10v_pressed():
	VarGlobal.setSelectedComponent("Lampada10v")
	MusicController.play_sfx("sfx_componentClick")


func _on_fonte10v_pressed():
	VarGlobal.setSelectedComponent("Fonte10v")
	MusicController.play_sfx("sfx_componentClick")


func _on_lampada20v_pressed():
	VarGlobal.setSelectedComponent("Lampada20v")
	MusicController.play_sfx("sfx_componentClick")


func _on_chave2t_pressed():
	VarGlobal.setSelectedComponent("Chave2t")
	MusicController.play_sfx("sfx_componentClick")


func _on_chave3t_pressed():
	VarGlobal.setSelectedComponent("Chave3t")
	MusicController.play_sfx("sfx_componentClick")


func _on_reload_pressed():
	pass # Replace with function body.
