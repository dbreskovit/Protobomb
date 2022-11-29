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
		
	if VariablesGlobal.lamp_2 == true:
		$Bomba/Button2.set_button_icon(lamp_on)
		$Bomba/Button3.set_button_icon(lamp_on)
		MusicController.play_sfx("sfx_bulbOn")

	if VariablesGlobal.lamp_3 == true:
		$Bomba/Button4.set_button_icon(lamp_on)
		$Bomba/Button5.set_button_icon(lamp_on)
		MusicController.play_sfx("sfx_bulbOn")
