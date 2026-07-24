extends CharacterBody2D

var _speed: float = 100.00
var _jump: float = -200.0
var contador_salto: int = 2

func _ready(): #Al iniciar el script se ejecuta esta funcion
	inicio_funcion_test()

func _physics_process(delta): #Es una funcion que se llama constantemente, una vez cada frame, y recibe delta que es el numero en decimales del frame anterior
	movimiento_horizontal(_speed) #Ejecuta la funcion de movimiento horizontal
	movimiento_vertical(delta)
	animaciones()
	move_and_slide() #Basciamente hace todas las comprobaciones de fisica con paredes, suelos etc despues de mover


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

func movimiento_vertical(delta):
	if is_on_floor():
		contador_salto = 2 #Cuando esta en el suelo, la varibale de contador de salto vuelve a 2
	velocity += get_gravity() * delta #Lo mismo que poner velocity = velocity + get_gravity(), le sumas el valor de la gravedad a la variable velocity
	if Input.is_action_just_pressed("ui_accept") and contador_salto > 0: #Si presionas el espacio y hay mas de 0 contadores de salto
		velocity.y = _jump #Aumentara en el eje y la velocidad de salto
		contador_salto = contador_salto-1 #Te quita un contador de salto, para que solo tengas un salto extra

func animaciones():
	if !is_on_floor():
		if contador_salto == 0:
			%AnimacionesPersonaje.play("doble_salto")
		else:
			%AnimacionesPersonaje.play("saltar")
	elif velocity.x != 0:
		%AnimacionesPersonaje.play("correr")
	else:
		%AnimacionesPersonaje.play("idle")
