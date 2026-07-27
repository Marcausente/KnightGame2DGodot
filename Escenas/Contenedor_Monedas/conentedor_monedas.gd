class_name ContenedorMonedas
extends Node2D

@export var reproductor: AudioStreamPlayer2D #Funcion para poder usar el reproductor de audi



var _total_monedas: int
var _monedas_recogidas: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var monedas := get_children() # Nos devuelve el array de monedas hijas
	
	#Para ver cuantas monedas tiene un nivel vamos a hacer lo siguiente
	for i in monedas.size(): #Hacemos un for que recorra todo el tamaño del array
		var moneda = monedas[i] #Moneda será la moneda actual que esta recorreindo el bucle
		if moneda.is_in_group("monedas"): #Si el hijo actual esta en el grupo moendas
			_total_monedas += 1 #Sumamos +1 en el grupo de monedas
		if moneda.has_signal("moneda_recogida"): # Si tiene la señal enviada por moneda
			moneda.moneda_recogida.connect(_on_moneda_recogida) #"Cuando emitas la señal moneda_recogida, llama automáticamente a _on_moneda_recogida()."
	

func _on_moneda_recogida() -> void:
	_monedas_recogidas += 1 #Se suma 1 al contador de monedas
	print("Monedas recogidas: ", _monedas_recogidas, "/", _total_monedas)
	reproductor.play() #Hace que suene el sonido de la moneda, que esta en AudioStreamPlayer2D
	
	ControladorGlobal.sumar_moneda()
	
	if _monedas_recogidas == _total_monedas:
		print("Nivel superado")
		var nodopadre = get_parent() #Recibe el nodo padre del contenedor de monedas
		var nodoabuelo = nodopadre.get_parent() #Recibe el nodo padre del nodo padre, el nodo abuelo
		nodoabuelo.siguiente_nivel()
