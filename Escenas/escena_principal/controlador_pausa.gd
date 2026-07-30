extends Control

func _input(event: InputEvent) -> void: #Esta funcion recibe un evento input, es decir, que se apriete algo
	if event.is_action_pressed("pausa") and get_tree().paused == false: #Si se aprieta el boton que tenemos configurado para la pausa
		get_tree().paused = true
	elif event.is_action_pressed("pausa") and get_tree().paused == true:
		get_tree().paused = false
