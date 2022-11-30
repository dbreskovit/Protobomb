extends Area2D

onready var path_follow = get_parent()
export var speed = 1000


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if VarGlobal.start:
		path_follow.offset = path_follow.offset+speed*delta
