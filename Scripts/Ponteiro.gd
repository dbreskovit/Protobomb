extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var number = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta):
	$".".rotation_degrees -= number * delta
