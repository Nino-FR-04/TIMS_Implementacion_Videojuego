extends RefCounted

var vida_actual: int
var esta_muerto: bool = false

func _init(vida_inicial: int) -> void:
	vida_actual = vida_inicial

func takeDamage(cantidad: int) -> void:
	if esta_muerto:
		return
		
	vida_actual -= cantidad
	
	if vida_actual <= 0:
		vida_actual = 0
		esta_muerto = true
