extends Node

var _total_monedas: int
var _monedas_regcogidas: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	var monedas:=get_children() #Nos devuelve el array de monedas hijas
	_total_monedas = monedas.size() #Nos da el numero total de momendas del nivel sacado del array de monedas
