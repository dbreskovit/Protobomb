extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lamp_on = preload("res://Assets/sprites/lampada_ligada.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_music("msc_game")
	MusicController.play_sfx("sfx_bulbBuzzTop")
	
	if VariablesGlobal.lamp_1 == true:
		$Bomba/Button.set_button_icon(lamp_on)
		MusicController.play_sfx("sfx_bulbOn")
		
	if VariablesGlobal.lamp_2 == true:
		$Bomba/Button2.set_button_icon(lamp_on)
		$Bomba/Button3.set_button_icon(lamp_on)
		MusicController.play_sfx("sfx_bulbOn")

	if VariablesGlobal.lamp_3 == true:
		$Bomba/Button4.set_button_icon(lamp_on)
		$Bomba/Button5.set_button_icon(lamp_on)
		MusicController.play_sfx("sfx_bulbOn")
		
		if VariablesGlobal.lamp_1 and VariablesGlobal.lamp_2 and VariablesGlobal.lamp_3:
			$Bomba/Button6.visible = true
			MusicController.stop_music("msc_game")
			MusicController.stop_sfx("sfx_clock")
			MusicController.stop_sfx("sfx_bulbBuzzTop")


func _on_Button_pressed():
	get_tree().change_scene("res://SistemaGrid/scenes/fase1.tscn")


func _on_Button3_pressed():
	get_tree().change_scene("res://SistemaGrid/scenes/fase2.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://SistemaGrid/scenes/fase2.tscn")


func _on_Button4_pressed():
	get_tree().change_scene("res://SistemaGrid/scenes/fase3.tscn")


func _on_Button5_pressed():
	get_tree().change_scene("res://SistemaGrid/scenes/fase3.tscn")


func _on_Button6_pressed():
	var _move = get_tree().change_scene("res://Scenes/Venceu.tscn")
