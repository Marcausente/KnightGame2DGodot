extends Node2D


var _total_monedas: int
var _monedas_recogidas: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var monedas := get_children() # Nos devuelve el array de monedas hijas
	_total_monedas = monedas.size() # Nos da el número total de monedas del nivel sacado del array
	
	for i in _total_monedas: # 'i' es el número de índice (0, 1, 2...), almacenamos la moneda en cuestion en i en cada ciclo
		var moneda = monedas[i] # Obtenemos el nodo moneda usando el índice 'i', ahora la moneda es el numero de monedas del arrau
		if moneda.has_signal("moneda_recogida"): # Si tiene la señal enviada por moneda
			moneda.moneda_recogida.connect(_on_moneda_recogida) #"Cuando emitas la señal moneda_recogida, llama automáticamente a _on_moneda_recogida()."

func _on_moneda_recogida() -> void:
	_monedas_recogidas += 1
	print("Monedas recogidas: ", _monedas_recogidas, "/", _total_monedas)
