extends Node2D


var grid = null
var fio = null
var mouseOnNode = false
var path = null
var finalized = false
export var fase = -1


# Called when the node enters the scene tree for the first time.
func _ready():
	VarGlobal.start = false
	init()
	
func init():
	grid = get_node("GridContainer")
	path = get_node("GridContainer/Path2D")
	var rowN = 0
	var cN = 0
	for row in grid.get_children():
		rowN = rowN + 1
		for c in row.get_children():
			cN = cN + 1
			var path = String(grid.get_path())
			path = path + "/row"+String(rowN)+"/c"+String(cN)+"/TextureButton"
			var Area2d = String(grid.get_path()) + "/row"+String(rowN)+"/c"+String(cN)+"/Area2D"
			var Sprint = path + "/Sprite"
			Sprint = get_node_or_null(Sprint)
			Area2d = get_node_or_null(Area2d)
			var node = get_node_or_null(path)
			if node != null:
				node.texture_normal = load("res://assets/download (1).png")
				node.add_to_group("node")
				var position2d = Position2D.new()
				position2d.gizmo_extents = 14
				position2d.name = "Position2D"
				position2d.position = Vector2(15, 15)
				node.add_child(position2d)
				node.set_script(load("res://scripts/node.gd"))
				node.set_process(true)
				node.get_parent().use_top_left = true
				node.get_parent().set_mouse_filter(Control.MOUSE_FILTER_IGNORE) 
				node.set_default_cursor_shape(Control.CURSOR_POINTING_HAND)
				if Area2d != null:
					node.get_parent().remove_child(Area2d)
				if Sprint != null:
					node.remove_child(Sprint)
				node.connect("pressed", self, "_on_TextureButton_pressed", [node])
				node.connect("mouse_entered", self, "_on_TextureButton_mouse_entered")
				node.connect("mouse_exited", self, "_on_TextureButton_mouse_exited")
		cN = 0
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fase == 3 and VarGlobal.start and finalized:
		if(get_node("GridContainer/row1/aR1R2c3c4/chave3t").animation == "1"):
			get_node("GridContainer/Path2D2/eletron").visible = true
			get_node("GridContainer/Path2D/eletron").visible = false
			get_node_or_null("GridContainer/row4/R4R5c5/lampada20v/Lampada20v/Lampada20v").animation = "desligada"
			get_node_or_null("GridContainer/row3/R3R4c7/lampada10v/Lampada10v/Lampada10v").animation = "ligada"
		else:
			get_node("GridContainer/Path2D/eletron").visible = true
			get_node("GridContainer/Path2D2/eletron").visible = false
			get_node_or_null("GridContainer/row4/R4R5c5/lampada20v/Lampada20v/Lampada20v").animation = "ligada"
			get_node_or_null("GridContainer/row3/R3R4c7/lampada10v/Lampada10v/Lampada10v").animation = "desligada"
	

func _on_TextureButton_pressed(node):
	var cN = String(node.get_parent().get_path())
	cN = int(cN[cN.length()-1])
	
	var rowN = String(node.get_parent().get_parent().get_path())
	rowN = int(rowN[rowN.length()-1])
	
	var p = get_node(String(node.get_path())+"/Position2D").position
	var pW = get_node(String(node.get_path())+"/Position2D").global_position
	if mouseOnNode:
		if fio == null:
			var scene = preload("res://scenes/fio.tscn")
			var instance = scene.instance()
			instance.add_point(Vector2(0, 0))
			instance.position = p
#			pathP.position = p
#			if pontoInicial == null:
#				path2d.add_point(pW)
			node.add_child(instance)
			fio = get_node_or_null(String(node.get_path())+"/fio")
			fio.p1 = Vector2(cN, rowN)
		else:
			var p1Fio = fio.p1
			if(p1Fio.y == rowN):
				var x = abs(p1Fio.x - cN)
				fio.p2 = Vector2(cN, rowN)
				if(p1Fio.x < cN):
					fio.add_point(Vector2(x*125, 0))
#					for vector in path2d.get_baked_points():
#						if(Vector2(x*125, 0) == vector):
#							break
#						else:
#							path2d.add_point(Vector2(p.x, p.y))
				else:
					fio.add_point(Vector2(-x*125, 0))
#					for vector in path2d.get_baked_points():
#						if(Vector2(-x*125, 0) == vector):
#							break
#						else:
#							path2d.add_point(Vector2(p.x, p.y))
			elif(p1Fio.x == cN):
				var y = abs(p1Fio.y - rowN)
				fio.p2 = Vector2(cN, rowN)
				if(p1Fio.y < rowN):
					fio.add_point(Vector2(0, y*125))
#					for vector in path2d.get_baked_points():
#						if(Vector2(0, y*125) == vector):
#							break
#						else:
#							path2d.add_point(Vector2(p.x, p.y))
				else:
					fio.add_point(Vector2(0, -y*125))
#					for vector in path2d.get_baked_points():
#						if(Vector2(0, -y*125) == vector):
#							break
#						else:
#							path2d.add_point(Vector2(p.x, p.y))
			fio = null
		


func _on_TextureButton_mouse_entered():
	mouseOnNode = true


func _on_TextureButton_mouse_exited():
	mouseOnNode = false


func _on_restart_pressed():
	get_tree().reload_current_scene()
	


func _on_start_pressed():
	if finalized:
		get_tree().quit()
	else:
		if fase == 1:
			verificarf1()
		elif fase == 2:
			verificarf2()
		elif fase == 3:
			verificar3()
	
func verificarf1():
	if(get_node_or_null("GridContainer/row3/R3R4c2/fonte10v") != null):
		if(get_node_or_null("GridContainer/row2/a45/chave2t") != null):
			if(get_node_or_null("GridContainer/row3/R3R4c7/lampada10v") != null):
				if(get_node_or_null("GridContainer/row3/c2/TextureButton/fio") != null):
					if(get_node_or_null("GridContainer/row2/c2/TextureButton/fio") != null):
						if(get_node_or_null("GridContainer/row2/c5/TextureButton/fio") != null):
							if(get_node_or_null("GridContainer/row2/c7/TextureButton/fio") != null):
								if(get_node_or_null("GridContainer/row4/c7/TextureButton/fio") != null):
									if(get_node_or_null("GridContainer/row5/c7/TextureButton/fio") != null):
										if(get_node_or_null("GridContainer/row5/c2/TextureButton/fio") != null):
											get_node("GridContainer/Path2D/eletron").visible = true
											VarGlobal.start  = true
											get_node("GridContainer/row3/R3R4c7/lampada10v/Lampada10v/Lampada10v").animation = "ligada"
											get_node_or_null("GridContainer/row2/a45/chave2t/Chave2t/Chave2t").animation = "fechada"
											finalized = true
											#LIGAR A LAMP DO NÍVEL AQUI

func verificarf2():
	if(get_node_or_null("GridContainer/row3/R3R4c2/fonte10v") != null):
		if(get_node_or_null("GridContainer/row2/a34/chave2t") != null):
			if(get_node_or_null("GridContainer/row2/R2R3c4/fonte10v") != null):
				if(get_node_or_null("GridContainer/row3/R3R4c4/lampada20v") != null):
					if(get_node_or_null("GridContainer/row2/a56/chave2t") != null):
						if(get_node_or_null("GridContainer/row3/R3R4c6/lampada10v") != null):
							
							if(get_node_or_null("GridContainer/row3/c2/TextureButton/fio") != null):
								print(1)
								if(get_node_or_null("GridContainer/row2/c2/TextureButton/fio") != null):
									print(2)
									if(get_node_or_null("GridContainer/row2/c4/TextureButton/fio") != null):
										print(3)
										if(get_node_or_null("GridContainer/row2/c6/TextureButton/fio") != null):
											print(4)
											if(get_node_or_null("GridContainer/row4/c6/TextureButton/fio") != null):
												print(5)
												if(get_node_or_null("GridContainer/row5/c6/TextureButton/fio") != null):
													print(6)
													if(get_node_or_null("GridContainer/row4/c4/TextureButton/fio") != null):
														print(7)
														if(get_node_or_null("GridContainer/row5/c4/TextureButton/fio") != null):
															print(8)
															if(get_node_or_null("GridContainer/row5/c2/TextureButton/fio") != null):
																print(9)
																get_node("GridContainer/Path2D/eletron").visible = true
																get_node("GridContainer/Path2D2/eletron").visible = true
																VarGlobal.start  = true
																get_node("GridContainer/row3/R3R4c4/lampada20v/Lampada20v/Lampada20v").animation = "ligada"
																get_node_or_null("GridContainer/row3/R3R4c6/lampada10v/Lampada10v/Lampada10v").animation = "ligada"
																get_node_or_null("GridContainer/row2/a34/chave2t/Chave2t/Chave2t").animation = "fechada"
																get_node_or_null("GridContainer/row2/a56/chave2t/Chave2t/Chave2t").animation = "fechada"
																finalized = true
												
func verificar3():
	if(get_node_or_null("GridContainer/row3/R3R4c2/fonte10v") != null):
		if(get_node_or_null("GridContainer/row1/aR1R2c3c4/chave3t") != null):
			if(get_node_or_null("GridContainer/row3/R3R4c5/fonte10v") != null):
				if(get_node_or_null("GridContainer/row4/R4R5c5/lampada20v") != null):
					if(get_node_or_null("GridContainer/row3/R3R4c7/lampada10v") != null):
						
						if(get_node_or_null("GridContainer/row3/c2/TextureButton/fio") != null):
							if(get_node_or_null("GridContainer/row2/c2/TextureButton/fio") != null):
								if(get_node_or_null("GridContainer/row1/c4/TextureButton/fio") != null):
									if(get_node_or_null("GridContainer/row1/c7/TextureButton/fio") != null):
										if(get_node_or_null("GridContainer/row4/c7/TextureButton/fio") != null):
											if(get_node_or_null("GridContainer/row5/c7/TextureButton/fio") != null):
												if(get_node_or_null("GridContainer/row5/c5/TextureButton/fio") != null):
													if(get_node_or_null("GridContainer/row5/c2/TextureButton/fio") != null):
														if(get_node_or_null("GridContainer/row2/c4/TextureButton/fio") != null):
															if(get_node_or_null("GridContainer/row2/c5/TextureButton/fio") != null):
																get_node_or_null("GridContainer/row1/aR1R2c3c4/chave3t/Chave3t/Chave3t").animation = "2"
																get_node_or_null("GridContainer/row4/R4R5c5/lampada20v/Lampada20v/Lampada20v").animation = "ligada"
																get_node_or_null("GridContainer/row3/R3R4c7/lampada10v/Lampada10v/Lampada10v").animation = "ligada"
																if(get_node("GridContainer/row1/aR1R2c3c4/chave3t").animation == "1"):
																	get_node("GridContainer/Path2D2/eletron").visible = true
																else:
																	get_node("GridContainer/Path2D/eletron").visible = true
																
																VarGlobal.start  = true
																finalized = true
