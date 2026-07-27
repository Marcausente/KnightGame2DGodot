extends Control

@export var label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ControladorGlobal.monedas_actualizado.connect(_actualizar_texto) #Si se conecta al contador global directamente ejecuta actualizar texto
	ControladorGlobal.total_monedas_actualizado.connect(_actualizar_texto)
#FALTA CONFUGURAR EL TOTAL DE MONEDAS, ES DECIR X/8 POR EJEMPLO
func _actualizar_texto():
	var MonedasTexto = str(ControladorGlobal.monedas)
	var TotalMonedas = str(ControladorGlobal.total_monedas)
	label.text = "Monedas: " + MonedasTexto + " / " + TotalMonedas
