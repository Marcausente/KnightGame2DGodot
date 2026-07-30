extends Node2D

@export var niveles: Array[PackedScene] #Llamamos a un array que tiene varias escenas o niveles
var _nivel_actual: int = 1 #Variable para definir el nivel actual
var _nivel_instanciado: Node #Instanciado se refiere al nivel que esta cargado
@export var controlador_partida: ControladorPartida #Variable controlador_partida de tipo clase propia ControladorPartida


# Se llama cuando empieza la funcion
func _ready() -> void:
	if ControladorGlobal.nivelActual > 1: #Si el nivel actual es mas de uno
		_cargar_nivel() #Significa que es una partida guardada y por ello cargaremos nivel
	else:
		_crear_nivel(_nivel_actual) #Cargamos el nivel con la variable _nivel_actual, por defecto es uno

func _crear_nivel(numero_nivel: int):
	if numero_nivel < 1 or numero_nivel > niveles.size(): # Comprobamos si el número de nivel solicitado existe dentro del array
		get_tree().change_scene_to_file("res://Escenas/MenuPrincipal/menu_principal.tscn") # Si no hay mas niveles volvemos al menú principal
		return # Interrumpe la ejecucion para no cargar un nivel inexistente

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
		
	if controlador_partida: # Comprobamos que el controlador exista antes de guardar
		controlador_partida.guardar_partida() #Se guardara el nivel actual en la clase ControladorPartida
		
func _eliminar_nivel():
	_nivel_instanciado.queue_free() #Libera el nodo en cuestion (En este caso el actual, liberar es borrar)

func _reiniciar_nivel(): 
	_nivel_instanciado.queue_free() #Borramos el nivel actual
	_crear_nivel.call_deferred(_nivel_actual) #Y lo volvemos a cargar, call deferred es para eviatar errores y cargarlo al final del frame


func siguiente_nivel():
	_nivel_actual += 1
	ControladorGlobal.nivel_actual(_nivel_actual)
	ControladorGlobal.resetear_moneda() #Resetea el contador de monedas
	_eliminar_nivel() #Ejecuta la funcion eliminar nivel
	_crear_nivel.call_deferred(_nivel_actual) #Y lo volvemos a cargar, call deferred es para eviatar errores y cargarlo al final del frame

func _cargar_nivel():
	_nivel_actual = ControladorGlobal.nivelActual #Cogemos la variable nivel actual de la guardada
	#Ahora creamos el nivel de la variable que teniamos en nivel actual
	_crear_nivel.call_deferred(_nivel_actual) #Calldefered es para esperar a que se borre el anterior nivel antes de generar el nuevo, indispensable
	
