extends GutTest
var player

func before_each():
	player = PlayerController.new()

# El jugador puede saltar cuando está en el suelo
func test_playerCanJump():
	player.on_floor = true
	player.jump()
	assert_eq(player.velocity.y, player.jump_force)

# No puede saltar estando en el aire
func test_playerCannotJumpInAir():
	player.on_floor = false
	player.jump()
	assert_eq(player.velocity.y, 0.0)

# La gravedad aumenta la velocidad
func test_gravityIncreasesVelocity():
	player.on_floor = false
	player.velocity.y = 0
	player.apply_gravity(1.0)
	assert_gt(player.velocity.y, 0)

# En el suelo no actúa la gravedad
func test_gravityNotAppliedOnFloor():
	player.on_floor = true
	player.velocity.y = 0
	player.apply_gravity(1.0)
	assert_eq(player.velocity.y, 0.0)

# Después de aterrizar vuelve a saltar
func test_playerCanJumpAgain():
	player.on_floor = true
	player.jump()
	player.on_floor = false
	player.velocity.y = 250
	player.on_floor = true
	player.jump()
	assert_eq(player.velocity.y, player.jump_force)

# No existe doble salto
func test_doubleJumpNotAllowed():
	player.on_floor = true
	player.jump()
	player.on_floor = false
	var previous = player.velocity.y
	player.jump()
	assert_eq(player.velocity.y, previous)

# La fuerza del salto siempre es igual
func test_jumpForceConstant():
	player.on_floor = true
	player.jump()
	assert_eq(player.velocity.y, player.jump_force)
