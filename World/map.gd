extends Node2D

@onready var pauseMenu = $CanvasLayer/Pause
var paused = false
func _process(delta):
	if (Input.is_action_just_pressed("pause")):
		pause() 

func pause():
	if (paused):
		pauseMenu.hide()
		Engine.time_scale = 1
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		pauseMenu.show()
		Engine.time_scale = 0
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	paused = !paused
