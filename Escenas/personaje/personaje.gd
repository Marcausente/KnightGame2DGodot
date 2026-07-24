extends CharacterBody2D

var _speed: float = 65.00

func _ready(): #Al iniciar el script se ejecuta esta funcion
	inicio_funcion_test()

func _process(delta): #Es una funcion que se llama constantemente, una vez cada frame, y recibe delta que es el numero en decimales del frame anterior
	if Input.is_action_pressed("ui_right"):
		velocity.x = _speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -_speed
	else: 
		velocity.x = 0
	move_and_slide() #Esta funcion se debe poner en las funciones de movimiento, hace que se gestionen solas las colisiones

func inicio_funcion_test(): #Funcion que nos da los datos de prueba por consola
	print("Se ha iniciado la funcion")
	print("Velocidad: ", _speed) 
