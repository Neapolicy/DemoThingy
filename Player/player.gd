extends CharacterBody2D

const SPEED = 200.0
var direction
@export var charStateMachine : CharStateMachine
@export var hitState : State
@onready var animTree : AnimationTree = $AnimationTree
@onready var detector = $RayCast2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	update_animation_parameters()
	update_raycast_dir()
	
func _physics_process(delta):
	if charStateMachine.checkStunned():
		direction = Input.get_vector("left", "right", "up", "down")
	if direction && charStateMachine.checkStunned():
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	elif (charStateMachine.currentState != hitState):
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()

func update_animation_parameters():
	if (velocity == Vector2.ZERO):
		animTree["parameters/conditions/idle"] = true
		animTree["parameters/conditions/is_moving"] = false
	else:
		animTree["parameters/conditions/idle"] = false
		animTree["parameters/conditions/is_moving"] = true
	
	if (direction != Vector2.ZERO):
		animTree["parameters/Idle/blend_position"] = direction
		animTree["parameters/Walk/blend_position"] = direction

func update_raycast_dir():
	if (direction.x == 1):
		detector.rotation = -PI / 2
	if (direction.x == -1):
		detector.rotation = PI / 2
	if (direction.y == 1):
		detector.rotation = 0
	if (direction.y == -1):
		detector.rotation = PI
