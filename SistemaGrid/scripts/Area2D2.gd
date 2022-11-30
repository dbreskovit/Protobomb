extends Area2D


var selected = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if selected && Input.is_action_pressed("click"):
		
		for child in get_parent().get_children():
			var selfgroup = ""
			var isgroup = true
			for group in self.get_groups():
				selfgroup += group+" "
				
			for group in child.get_groups():
				if(selfgroup.find(group) == -1):
					isgroup = false
					break
					
			if isgroup:
				get_node(child.get_path()).disconnect("mouse_entered", child, "_on_Area2D_mouse_entered")
		
		var aux = String(get_parent().get_path())
		aux = aux.substr(aux.length()-1)
		aux = int(aux)+1
		aux = String(aux)
		var path = String(get_parent().get_path())
		path = path.substr(0, path.length()-1)+aux
		
		if(get_node_or_null(path) != null):
			for child in get_node(path).get_children():
				var selfgroup = ""
				var isgroup = true
				for group in self.get_groups():
					selfgroup += group+" "
					
				for group in child.get_groups():
					if(selfgroup.find(group) == -1):
						isgroup = false
						break
						
				if isgroup:
					get_node(child.get_path()).disconnect("mouse_entered", child, "_on_Area2D_mouse_entered")
		
		var scene = ""
		if VarGlobal.selectedComponent == "Chave3t":
			scene = preload("res://SistemaGrid/scenes/chave3t.tscn")
			
		var instance = scene.instance()
		if self.rotation_degrees == 90:
			instance.rotation_degrees = 90
		self.add_child(instance)
		selected = false
		self.disconnect("mouse_entered", self, "_on_Area2D2_mouse_entered")

func _on_Area2D2_mouse_entered():
	if VarGlobal.selectedComponent == "Chave3t":
		get_node("Chave3t").visible = true
		selected = true


func _on_Area2D2_mouse_exited():
	get_node("Chave3t").visible = false
	selected = false
