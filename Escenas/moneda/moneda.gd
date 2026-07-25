extends Node2D

signal moneda_recogida

@export var area_2d: Area2D #Funcion para representar el nodo Area2D

func _ready():
	add_to_group("monedas")
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()
	print("moneda")
	moneda_recogida.emit()
