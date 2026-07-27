extends Node

signal monedas_actualizado
signal total_monedas_actualizado
signal nivelActual_actualizado

var nivelActual: int = 1
var monedas: int
var total_monedas: int = 0

func sumar_moneda():
	monedas = monedas + 1
	monedas_actualizado.emit()

func resetear_moneda():
	monedas = 0
	monedas_actualizado.emit()

func monedas_totales(monedasTotal):
	total_monedas = monedasTotal
	total_monedas_actualizado.emit()

func nivel_actual(nivel):
	nivelActual = nivel
	nivelActual_actualizado.emit()
