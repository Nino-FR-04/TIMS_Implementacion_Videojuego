extends GutTest

var player
var diamond

func before_each():
	player = PlayerController.new()
	diamond = DiamondController.new()

# El diamante permanece bloqueado
func test_diamondIsLoocked():
	assert_false(diamond.is_unlocked)
	
# El diamante requiere 5 monedas por defecto
func test_diamondDefaultRequiredCoins():
	assert_eq(diamond.required_coins, 5)

# El diamante no se desbloquea sin monedas
func test_diamondDoesNotUnlockedWithoutCoins():

	player.coin_count = 0

	var result = diamond.try_open(player.coin_count)

	assert_false(result)
	assert_false(diamond.is_unlocked)

# El diamante no se desbloquea con menos monedas de las necesarias
func test_diamondDoesNotUnlockedWithInsufficientCoins():

	diamond.required_coins = 5

	player.coin_count = 3

	var result = diamond.try_open(player.coin_count)

	assert_false(result)
	assert_false(diamond.is_unlocked)

# El diamante se desbloquea con la cantidad exacta
func test_diamondUnlockedWithExactRequiredCoins():

	diamond.required_coins = 5

	player.coin_count = 5

	var result = diamond.try_open(player.coin_count)

	assert_true(result)
	assert_true(diamond.is_unlocked)

# Cambiar la cantidad de monedas requeridas
func test_diamondWithDifferentRequiredAmount():

	diamond.required_coins = 15
	player.coin_count = 10
	assert_false(diamond.try_open(player.coin_count))

	player.coin_count = 15
	assert_true(diamond.try_open(player.coin_count))
