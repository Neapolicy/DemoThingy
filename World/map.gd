extends Node2D

var player
var pauseMenu
var paused = false

func _ready():
	player = preload("res://Player/player.tscn").instantiate()
	pauseMenu = preload("res://Menus/pause.tscn").instantiate()
	add_child(player)
	add_child(pauseMenu)
	pauseMenu.visible = false
	
func _process(delta):
	if (Input.is_action_just_pressed("pause") && !player.charStateMachine.interacting()):
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
