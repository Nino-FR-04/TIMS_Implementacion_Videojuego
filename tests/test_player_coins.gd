extends GutTest

var player

func before_each():
	player = PlayerController.new()

# El jugador inicia con 0 monedas
func test_player_starts_with_zero_coins():
	assert_eq(player.coin_count, 0)

# Recoger una moneda
func test_collect_one_coin():
	player.collect_coin()
	assert_eq(player.coin_count, 1)

# Recoger varias monedas
func test_collect_multiple_coins():
	player.collect_coin()
	player.collect_coin()
	player.collect_coin()
	assert_eq(player.coin_count, 3)

# Reiniciar monedas
func test_reset_coins():
	player.collect_coin()
	player.collect_coin()
	player.reset_coins()
	assert_eq(player.coin_count, 0)

# El contador nunca es negativo
func test_coin_counter_never_negative():
	player.reset_coins()
	assert_gte(player.coin_count, 0)

# Recoger muchas monedas
func test_collect_ten_coins():
	for i in range(10):
		player.collect_coin()
	assert_eq(player.coin_count, 10)
