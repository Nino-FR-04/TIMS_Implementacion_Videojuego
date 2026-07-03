extends CharacterBody2D

var controller := PlayerController.new()
@onready var animSprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction := Input.get_axis("left", "right")
	print("Direction:", direction)
	controller.move(direction)
	velocity = controller.velocity

	move_and_slide()
	self.update_anim(direction)
	print("Posición:", global_position)
	
func update_anim(direction: float):
	if direction != 0:
		self.animSprite.flip_h = direction < 0
		self.animSprite.play("run_anim")
	else:
		self.animSprite.play("idle_anim")
		
		
