class_name ControladorPartida
extends Node

@export var controlador_partida: ControladorPartida
@export var partida: DatosPartida #Partida sera la clase datos partida

var _ruta: String = "user://partida.tres" #Para referenciar la ruta del archivo, user se refiere a la por defecto de Windows

func guardar_partida():
	partida.nivel = ControladorGlobal.nivelActual #Iguala la variable nivel de la clase DatosPartida y la asigna a la actual con el controlador Global
	
	ResourceSaver.save(partida, _ruta) #Guardamos el resource partida en la ruta de la variable _ruta


func cargar_partida():
	if ResourceLoader.exists(_ruta): #Si existe un archivo de guardado en nuestra carpeta de guardado
		partida = load(_ruta) #Mete los datos del resource de la ruta en la variable partida
		
		ControladorGlobal.nivel_actual(partida.nivel) #Ahora cargamos los datos de la partida guardada en nuestro controlador de nivel
		
