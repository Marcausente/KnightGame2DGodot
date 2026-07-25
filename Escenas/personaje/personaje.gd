extends CharacterBody2D

signal personaje_muerto #Funcion que enviaremos al scrpit escena_principal para reiniciar el nivel

@export var material_personaje_rojo: ShaderMaterial

var _speed: float = 100.00
var _jump: float = -220.0
var contador_salto: int = 2
var _muerto: bool = false

func _ready(): #Al iniciar el script se ejecuta esta funcion
	add_to_group("personajes") #Necesario para enviar signals a otros scripts
	inicio_funcion_test()

func _physics_process(delta): #Es una funcion que se llama constantemente, una vez cada frame, y recibe delta que es el numero en decimales del frame anterior
	if _muerto: #Si esta muerto nos devuelve fuera de la funcion para que no nos podamos mover
		return
	movimiento_horizontal(_speed) #Ejecuta la funcion de movimiento horizontal
	movimiento_vertical(delta)
	animaciones()
	move_and_slide() #Basciamente hace todas las comprobaciones de fisica con paredes, suelos etc despues de mover


func inicio_funcion_test(): #Funcion que nos da los datos de prueba por consola
	print("Se ha iniciado la funcion")
	print("Velocidad: ", _speed) 
	
func movimiento_horizontal(speed):
	if Input.is_action_pressed("derecha"): #Al apretarse la flecha derecha
		velocity.x = speed #La velocidad se incrementa en el eje X (Derecha)
		%AnimacionesPersonaje.flip_h = false
	elif Input.is_action_pressed("izquierda"): #Al apretarse la flecha Izquierda
		velocity.x = -speed #La velocidad se resta en el eje X (Izquierda)
		%AnimacionesPersonaje.flip_h = true
	else: 
		velocity.x = 0

func movimiento_vertical(delta):
	if is_on_floor():
		contador_salto = 2 #Cuando esta en el suelo, la varibale de contador de salto vuelve a 2
	velocity += get_gravity() * delta #Lo mismo que poner velocity = velocity + get_gravity(), le sumas el valor de la gravedad a la variable velocity
	if Input.is_action_just_pressed("saltar") and contador_salto > 0: #Si presionas el espacio y hay mas de 0 contadores de salto
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


func _on_area_2d_body_entered(body: Node2D) -> void: #Funcion conectada a Personaje -> Area2D -> Señales -> body_entered
	_muerto = true #El boleano a muerto pasa a ser verdad
	velocity = Vector2.ZERO #Detiene el movimiento inmediatamente
	%AnimacionesPersonaje.modulate = Color(18.892, 0.0, 0.0, 1.0) #Hace que el personaje cambie a rojo
	%AnimacionesPersonaje.stop()
	print("Recibe daño")
	
	var timer: Timer = Timer.new() #Crea una variable timer, basicamente es un contador de tiempo
	add_child(timer) #Añadimos el timer a la escena
	timer.start(0.3) #Inicia el timer en 0.3s
	await timer.timeout #Espera hasta que acabe el timer	
	personaje_muerto.emit() #Emite el personaje muerto
