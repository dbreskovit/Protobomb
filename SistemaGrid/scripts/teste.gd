extends Path2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var curve = Curve2D.new()
	curve.add_point(Vector2(0,0))
	curve.add_point(Vector2(0, 125))
	curve.get_baked_points()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
