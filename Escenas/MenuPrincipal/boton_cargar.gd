extends Button

@export var controlador_partida: ControladorPartida
@export var boton_jugar: Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_cargar) #Al apretar el boton se hara la función cargar

func _cargar():
	controlador_partida.cargar_partida() #Llama a la funcion cargar partida del controlador
	get_tree().change_scene_to_file("res://Escenas/escena_principal/escena_principal.tscn") #Cambia directamente a la escena principal con los datos cargados
