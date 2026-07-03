extends Area2D

@export var required_coins: int = 5
@onready var animSprite: AnimatedSprite2D = $AnimatedSprite2D

var controller := DiamondController.new()

func _ready():
	self.animSprite.play("default_anim")
	controller.required_coins = required_coins
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# Verifica que sea el jugador
	if body is CharacterBody2D:
		if controller.try_open(body.controller.coin_count):
			unlocked_diamond()
		else:
			print("Necesitas ", required_coins, " monedas.")

func unlocked_diamond():
	print("Diamante desbloqueado")
	self.animSprite.play("collected_anim")
	await animSprite.animation_finished
	
	queue_free()
