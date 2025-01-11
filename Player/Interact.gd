extends State

class_name Interact
@onready var dialogic_node = $Dialogic
@export var walk_state : State
func on_enter():
	Dialogic.signal_event.connect(_on_logic_signal)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#dialogic_node.connect("timeline_finished", self, "_on_dialogue_finished")
#func state_process(delta): meant for when the character is airborne without having jumped
	#if !character.is_on_floor() && buffer_timer.is_stopped():
		#nextState = jump_state
		
func _on_logic_signal(argument : String):
	if argument == "end":
		nextState = walk_state
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
