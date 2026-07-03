extends CharacterBody2D

var controller := PlayerController.new()
@onready var animSprite = $AnimatedSprite2D

func _physics_process(delta):
	
	self.controller.on_floor = self.is_on_floor()
	var direction := Input.get_axis("left", "right")
	controller.move(direction)
	
	if Input.is_action_just_pressed("jump"):
		self.controller.jump()
		
	self.controller.apply_gravity(delta)
	velocity = controller.velocity

	move_and_slide()
	self.update_anim(direction)
	
func update_anim(direction: float):
	
	if !self.is_on_floor():
		if self.velocity.y < 0:
			self.animSprite.play("jump_anim")
		else:
			self.animSprite.play("fall_anim")
	elif direction != 0:
		self.animSprite.flip_h = direction < 0
		self.animSprite.play("run_anim")
	else:
		self.animSprite.play("idle_anim")
		
func collect_coin():
	controller.collect_coin()
	print("Coins: ", controller.coin_count)	


func _on_area_2d_collected() -> void:
	self.collect_coin()
