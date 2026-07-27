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
	#Ahora _nivel_instanciado es el nivel que queremos cargar, es decdir, el 0
	add_child(_nivel_instanciado) #Añade como hijo lo que tengamos instanciado, lo añade hacia la referencia del codigo, en este caso escena_principal
	
	#Al crear un nuevo nivel buscara entre los hijos de la escena a ver cual es el personaje
	var hijos := _nivel_instanciado.get_children()
	for i in hijos.size(): #Hacemos un for que recorra todo el tamaño del array
		if hijos[i].is_in_group("personajes"): #Si el hijo actual esta en el grupo personajes
			var personaje = hijos[i] #Crea una variable que sea personajes que es igual a la señal enviada por personaje
			personaje.personaje_muerto.connect(_reiniciar_nivel) #Conecta el nodo de personaje al emitido por el otro script y ejecuta la funcion reiniciar nivel
			break
		
func _eliminar_nivel():
	_nivel_instanciado.queue_free() #Libera el nodo en cuestion (En este caso el actual, liberar es borrar)

func _reiniciar_nivel(): 
	_nivel_instanciado.queue_free() #Borramos el nivel actual
	_crear_nivel.call_deferred(_nivel_actual) #Y lo volvemos a cargar, call deferred es para eviatar errores y cargarlo al final del frame


func siguiente_nivel():
	_nivel_actual += 1
	ControladorGlobal.resetear_moneda() #Resetea el contador de monedas
	_eliminar_nivel() #Ejecuta la funcion eliminar nivel
	_crear_nivel.call_deferred(_nivel_actual) #Y lo volvemos a cargar, call deferred es para eviatar errores y cargarlo al final del frame
