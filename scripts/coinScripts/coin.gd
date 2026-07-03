extends Area2D

@onready var animSprite = $AnimatedSprite2D

signal collected

var is_collected := false

func _ready():
	body_entered.connect(_on_body_entered)
	animSprite.play("default_anim")


func _on_body_entered(body):
	if is_collected:
		return
	
	if body is CharacterBody2D:
		is_collected = true
		
		animSprite.play("collected_anim")
		collected.emit()
		
		await animSprite.animation_finished
		
		queue_free()
