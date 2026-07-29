extends Button

@export var escena_principal: PackedScene #Cargamos la escena principal porque es la que querremos cargar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(jugar) #Al presionar el boton se ejecutara la funcion jugar


func jugar():
	ControladorGlobal.nivel_actual(1) # Reinicia la variable de nivel a 1 al pulsar Jugar (partida nueva)
	get_tree().change_scene_to_packed(escena_principal) #Cambia la escena actual por la escena principal
	pressed.disconnect(jugar) #A veces viene bien desconectar la llamada para evitar errores
