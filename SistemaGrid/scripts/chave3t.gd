extends Node2D

var onArea2d = false
export var animation = "1"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if onArea2d and Input.is_action_pressed("click"):
		onArea2d = false
		if self.get_node("Chave3t/Chave3t").animation == "1":
			self.get_node("Chave3t/Chave3t").animation = "2"
			animation = "2"
		else:
			self.get_node("Chave3t/Chave3t").animation = "1"
			animation = "1"


func _on_Area2D_mouse_entered():
	onArea2d =  true
