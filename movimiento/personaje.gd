extends CharacterBody2D

@export var speed : float
var base_speed = 200
@export var jump_speed : float
var run_speed = 300
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func get_inptu(delta):
	var input_axis = Input.get_axis("move_left","move_right")
	velocity.x = input_axis * speed
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	if Input.is_action_pressed("run"):
		speed += run_speed * delta 
	else:
		speed = base_speed


func _physics_process(delta):
	
	get_inptu(delta)
	move_and_slide()

	
