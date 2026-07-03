class_name PlayerController
extends RefCounted

var speed: float = 200
var velocity := Vector2.ZERO

func move(direction: float):
	direction = clamp(direction, -1.0, 1.0)
	velocity.x = direction * speed
	print(velocity)
