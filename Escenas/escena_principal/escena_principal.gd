extends Node2D

@export var niveles: Array[PackedScene] #Llamamos a un array que tiene varias escenas o niveles
var _nivel_actual: int = 1 #Variable para definir el nivel actual
var _nivel_instanciado: Node #Instanciado se refiere al nivel que esta cargado


# Se llama cuando empieza la funcion
func _ready() -> void:
	_crear_nivel(_nivel_actual)

func _crear_nivel(numero_nivel: int):
	#Llamamos a la pos 0 del array (Nivel 1) Y la instanciamos (Cargamos), se tiene que restar uno porque siempre sera uno menos que el num del nivel
	_nivel_instanciado = niveles[numero_nivel - 1].instantiate() 
	#Ahora _nivel_instanciado es el nivel que queremos cargar, es decir, el 0
	add_child(_nivel_instanciado) #Añade como hijo lo que tengamos instanciado, lo añade hacia la referencia del codigo, en este caso escena_principal
