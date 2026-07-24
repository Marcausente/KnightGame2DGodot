extends CharacterBody2D

var _speed: float = 65.00

func _ready(): #Al iniciar el script se ejecuta esta funcion
	inicio_funcion_test()

func _physics_process(delta): #Es una funcion que se llama constantemente, una vez cada frame, y recibe delta que es el numero en decimales del frame anterior
	
	movimiento_horizontal(_speed) #Ejecuta la funcion de movimiento horizontal
	move_and_slide()


func inicio_funcion_test(): #Funcion que nos da los datos de prueba por consola
	print("Se ha iniciado la funcion")
	print("Velocidad: ", _speed) 
	
func movimiento_horizontal(speed):
	if Input.is_action_pressed("ui_right"): #Al apretarse la flecha derecha
		velocity.x = speed #La velocidad se incrementa en el eje X (Derecha)
	elif Input.is_action_pressed("ui_left"): #Al apretarse la flecha Izquierda
		velocity.x = -speed #La velocidad se resta en el eje X (Izquierda)
	else: 
		velocity.x = 0
