class_name PlayerController
extends RefCounted

var speed: float = 200
var jump_force: float = -350.0
var gravity: float = 980.0

var velocity := Vector2.ZERO
var on_floor := true

var coin_count := 0

func move(direction: float):
	direction = clamp(direction, -1.0, 1.0)
	velocity.x = direction * speed

func jump():
	if on_floor:
		velocity.y = jump_force
		on_floor = false

func apply_gravity(delta):
	if !on_floor:
		velocity.y += gravity * delta
		
func collect_coin():
	coin_count += 1

func reset_coins():
	coin_count = 0
