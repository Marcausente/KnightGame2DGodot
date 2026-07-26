extends Node2D

signal moneda_recogida

@export var area_2d: Area2D #Funcion para representar el nodo Area2D

func _ready():
	add_to_group("monedas")
	_iniciar_animacion()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("moneda")
	moneda_recogida.emit()
	queue_free()


func _iniciar_animacion():
	#Los Tweens sirven para animaciones y otras cosas, basicamente sirve para cambiar un valor gradualmente hasta
	#que llegue a otro valor que nosotros le digamos
	var tween: Tween = create_tween() #Creamos un tween
	tween.set_loops(0) #Le decimos la cantidad de veces que repetimos la animacion, 0 es infinito
	#Queremos hacer el tween de una propiedad (El eje y) de la moneda, self porque es del propio objeto del script
	#Ademas le hemos puesto una trans (Transicion) sirve para que haga una animacion especifica, hay varias ya hechas, hemos elegido cubic y que se haga tanto al principio como al final (Easi in out)
	tween.tween_property(self, "position:y", position.y - 2, 0.6).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT) #Queremos que la moneda suba 5 pixeles hacia arriba en 0.5 segundos
	tween.tween_property(self, "position:y", position.y + 2, 0.6).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT) #Al subir, volvera a bajar
	
