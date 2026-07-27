extends Node

signal monedas_actualizado

var monedas: int

func sumar_moneda():
	monedas = monedas + 1
	monedas_actualizado.emit()
