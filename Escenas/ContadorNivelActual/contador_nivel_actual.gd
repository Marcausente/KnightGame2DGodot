extends Control

@export var label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ControladorGlobal.nivelActual_actualizado.connect(_actualizar_nivel)


func _actualizar_nivel():
	var NivelActual = str(ControladorGlobal.nivelActual)
	label.text = "Nivel: " + NivelActual
