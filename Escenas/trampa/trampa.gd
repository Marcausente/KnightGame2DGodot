extends RigidBody2D
@export var longitud_raycast: float = 150.0 #variable que luego nos permite configurarle el raycast


@export var raycast: RayCast2D #Esto nos deja interactuar con el raycast del objeto, es un laser basicamente

func _ready():
	freeze = true #Al iniciar la partida, freeze sera true, freeze hace que el objeto este congelado y no tenga gravedad ni se mueva
	raycast.target_position.y = longitud_raycast #La longitud que tendrá el Raycast es la longitud que le hayamos pasado a la variable en el inspector
	
func _physics_process(delta: float) -> void:
	if raycast.get_collider() != null: #get_collider devuelve true si ha detectado algo, si no detecta es null
		freeze = false #Le quitamos la congelacion al objeto
