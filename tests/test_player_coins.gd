extends GutTest

var player

func before_each():
	player = PlayerController.new()

# El jugador inicia con 0 monedas
func test_playerStartsWithZeroCoins():
	assert_eq(player.coin_count, 0)

# Recoger una moneda
func test_collectOneCoin():
	player.collect_coin()
	assert_eq(player.coin_count, 1)

# Recoger varias monedas
func test_collectMultipleCoins():
	player.collect_coin()
	player.collect_coin()
	player.collect_coin()
	assert_eq(player.coin_count, 3)

# Reiniciar monedas
func test_resetCoins():
	player.collect_coin()
	player.collect_coin()
	player.reset_coins()
	assert_eq(player.coin_count, 0)

# El contador nunca es negativo
func test_coinCounterNeverNegative():
	player.reset_coins()
	assert_gte(player.coin_count, 0)

# Recoger muchas monedas
func test_collectTenCoins():
	for i in range(10):
		player.collect_coin()
	assert_eq(player.coin_count, 10)
