extends GutTest

#Jugador
var player

#Se ejecuta antes de cada test
func before_each():
	player = preload("res://scripts/playerScripts/player_controller.gd").new()

#Test - Estado: Idle
func test_playerWithZeroVelocity():
	assert_eq(player.velocity.x, 0.0)
	
#Test - Estado: Movimiento - Derecha
func test_playerMoveToRight():
	player.move(1)
	assert_eq(player.velocity.x, player.speed)

#Test - Estado: Movimiento - Izquierda
func test_playerMoveToLeft():
	player.move(-1)
	assert_eq(player.velocity.x, -player.speed)
	
#Test - Estado: Movimiento y se detiene
func test_playerMoveToRightThenStops():
	player.move(1)
	player.move(0)
	assert_eq(player.velocity.x, 0.0)
	
#Test - Estado: Movimiento
func test_playerSpeedIsLimited():
	player.move(50)
	assert_lte(abs(player.velocity.x), player.speed)
	
#Test - Estado: Movimiento con cambios de direccion
func test_playerChangesDirection():
	player.move(1)
	assert_eq(player.velocity.x, player.speed)
	player.move(-1)
	assert_eq(player.velocity.x, -player.speed)
