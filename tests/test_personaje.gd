extends GutTest

# Esta función se ejecuta antes de cada test para limpiar el escenario
func before_each():
	pass

func test_cuando_el_danio_supera_la_vida_el_personaje_muere():
	var logica = load("res://scripts/player_logica.gd").new(100)
	
	# 2. ACT (Actuar)
	logica.takeDamage(120)
	
	print(logica.vida_actual)
	
	assert_eq(logica.vida_actual, 0, "La vida debería quedarse en 0")
	assert_true(logica.esta_muerto, "El estado 'esta_muerto' debería ser verdadero")
