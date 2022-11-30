extends Area2D


var selected = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selected && Input.is_action_pressed("click"):
		for child in get_parent().get_children():
			var childgroup = ""
			var isgroup = true
			for group in child.get_groups():
				childgroup += group+" "
				
			for group in self.get_groups():
				if(childgroup.find(group) == -1):
					isgroup = false
					break
					
			if isgroup:
				get_node(child.get_path()).disconnect("mouse_entered", child, "_on_Area2D2_mouse_entered")
		
		var aux = String(get_parent().get_path())
		aux = aux.substr(aux.length()-1)
		aux = int(aux) -1
		aux = String(aux)
		var path = String(get_parent().get_path())
		path = path.substr(0, path.length()-1)+aux
		
		if(get_node_or_null(path) != null):
			for child in get_node(path).get_children():
				var childgroup = ""
				var isgroup = true
				for group in child.get_groups():
					childgroup += group+" "
					
				for group in self.get_groups():
					if(childgroup.find(group) == -1):
						isgroup = false
						break
						
				if isgroup:
					get_node(child.get_path()).disconnect("mouse_entered", child, "_on_Area2D2_mouse_entered")
		
		var scene = ""
		if VarGlobal.selectedComponent == "Fonte10v":
			scene = preload("res://scenes/fonte10v.tscn")
		elif VarGlobal.selectedComponent == "Lampada10v":
			scene = preload("res://scenes/lampada10v.tscn")
		elif VarGlobal.selectedComponent == "Lampada20v":
			scene = preload("res://scenes/lampada20v.tscn")
		elif VarGlobal.selectedComponent == "Chave2t":
			scene = preload("res://scenes/chave2t.tscn")
			
		var instance = scene.instance()
		
		if self.rotation_degrees >= 90:
			instance.position.x = -7
			instance.position.y = 10
		else:
			instance.position.x = -10
			instance.position.y = -6
		self.add_child(instance)
		selected = false
		self.disconnect("mouse_entered", self, "_on_Area2D_mouse_entered")
	


func _on_Area2D_mouse_entered():
	if(get_node_or_null(VarGlobal.selectedComponent) != null):
		get_node(VarGlobal.selectedComponent).visible = true
		selected = true


func _on_Area2D_mouse_exited():
	if(get_node_or_null(VarGlobal.selectedComponent) != null):
		get_node(VarGlobal.selectedComponent).visible = false
		selected = false		
