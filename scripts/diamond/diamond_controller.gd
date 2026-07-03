class_name DiamondController
extends RefCounted

## Número de monedas necesarias para desbloquear el diamante
var required_coins: int = 5

## Estado del diamante
var is_unlocked: bool = false

## Intenta recoger el diamante
func try_open(player_coins: int) -> bool:
	is_unlocked = player_coins >= required_coins
	return is_unlocked
