class_name ControladorPartida
extends Node

@export var partida: DatosPartida #Partida sera la clase datos partida

var _ruta: String = "user://partida.tres" #Para referenciar la ruta del archivo, user se refiere a la por defecto de Windows

func guardar_partida():
	partida.nivel = ControladorGlobal.nivelActual #Iguala la variable nivel de la clase DatosPartida y la asigna a la actual con el controlador Global
	
	ResourceSaver.save(partida, _ruta) #Guardamos el resource partida en la ruta de la variable _ruta
