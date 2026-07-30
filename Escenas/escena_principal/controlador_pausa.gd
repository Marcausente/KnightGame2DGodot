extends Control

@export var texto_pausa: Control

func _input(event: InputEvent) -> void: #Esta funcion recibe un evento input, es decir, que se apriete algo
	if event.is_action_pressed("pausa") and get_tree().paused == false: #Si se aprieta el boton que tenemos configurado para la pausa
		get_tree().paused = true #Pone la pausa
		texto_pausa.visible = true #Se muestra el texto de texto_pausa
	elif event.is_action_pressed("pausa") and get_tree().paused == true: #Si se aprieta el boton de pausa Y ya estaba pausado
		get_tree().paused = false #Quita la pausa
		texto_pausa.visible = false #Se quita el texto de texto_pausa
