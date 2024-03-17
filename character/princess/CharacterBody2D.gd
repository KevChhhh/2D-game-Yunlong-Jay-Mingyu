extends CharacterBody2D
signal spawning

#const SPEED = 900.0
#const JUMP_VELOCITY = -700.0
@export var SPEED = 900.0
@export var JUMP_VELOCITY = -700.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var respawn_point = $respawn


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_control


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite_2d.play("jump")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("moveLeft", "moveRight")
	if direction:
		velocity.x = direction * SPEED
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if velocity.x < 0:
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play('run')
	elif velocity.x > 0:
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play('run')
	elif velocity == Vector2.ZERO:
		animated_sprite_2d.play("idle")
	move_and_slide()

func on_hit () -> void:
	visible = false

var alive = true 


func respawn():
	position.x = 0
	position.y = 0
	print("respawning")
	emit_signal("spawning")
	alive = true
	move_and_slide()


func kill():
	alive = false
	velocity.y = 0
	respawn()


	