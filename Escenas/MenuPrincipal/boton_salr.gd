extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_salir) #Al presionarse ejecuta la funcion salir


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _salir():
	get_tree().quit() #Funcion para salir
