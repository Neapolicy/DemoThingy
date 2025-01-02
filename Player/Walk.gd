extends State

@onready var buffer_timer = $BufferTImer
@export var JUMP_VELOCITY = -275.0 #max is 550
@export var jump_state : State
@export var attack_state : State
var jump_time : float

#func state_input(event : InputEvent):
	#if Input.is_action_pressed("up"): #and this only is considered for the first jump
		#jump_time += .1
	#if Input.is_action_just_released("up"):
		#playback.travel("Jump")
		#nextState = jump_state
		#jump()
	#if (event is InputEventMouseButton and event.pressed):
		#if (event.button_index == MOUSE_BUTTON_LEFT):
			#playback.travel("attack")
			#nextState = attack_state
		#
#func state_process(delta):
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
