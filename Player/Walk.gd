extends State

@onready var buffer_timer = $BufferTImer
@onready var detector = $"../../RayCast2D"
@export var JUMP_VELOCITY = -275.0 #max is 550
@export var jump_state : State
@export var attack_state : State
@export var interact_state : State
var jump_time : float

func state_input(event : InputEvent):
	if (Input.is_action_just_pressed("interact")):
		if (detector.is_colliding()):
			var collided_object = detector.get_collider()
			if collided_object and collided_object.has_method("interact"):
				collided_object.interact()  # Call the method if it exists
				nextState = interact_state
		
#func state_process(delta): meant for when the character is airborne without having jumped
	#if !character.is_on_floor() && buffer_timer.is_stopped():
		#nextState = jump_state
		#
#func jump():
	#if (jump_time > .5):
		#jump_time = .5 #and then force a jump
	#if (character.is_on_floor()):
		#character.velocity.y = JUMP_VELOCITY * (1.5 + jump_time)
		#$"../Air".d_jumped = false
		#jump_time = 0
