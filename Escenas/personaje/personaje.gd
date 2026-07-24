extends CharacterBody2D

var speed: float = 70.00

func _ready(): #Al iniciar el script se ejecuta esta funcion
	inicio_funcion_test()

func _process(delta): #Es una funcion que se llama constantemente, una vez cada frame, y recibe delta que es el numero en decimales del frame anterior
	if Input.is_action_pressed("ui_right"):
		velocity.x = 50
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -50
	else: 
		velocity.x = 0
	move_and_slide()

func inicio_funcion_test(): #Funcion que nos da los datos de prueba por consola
	print("Se ha iniciado la funcion")
	print("Velocidad: ", speed) 
