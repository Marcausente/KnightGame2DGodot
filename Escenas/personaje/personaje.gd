extends CharacterBody2D

var speed: float = 100.00

func _ready(): #Al iniciar el script se ejecuta esta funcion
	inicio_funcion_test()


func inicio_funcion_test(): #Funcion que nos da los datos de prueba por consola
	print("Se ha iniciado la funcion")
	print(speed)
