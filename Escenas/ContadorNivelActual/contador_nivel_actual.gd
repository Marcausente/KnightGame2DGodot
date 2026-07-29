extends Control

@export var label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ControladorGlobal.nivelActual_actualizado.connect(_actualizar_nivel)
	_actualizar_nivel() # Actualiza el texto del nivel en la interfaz al iniciar la escena


func _actualizar_nivel():
	var NivelActual = str(ControladorGlobal.nivelActual)
	label.text = "Nivel: " + NivelActual
