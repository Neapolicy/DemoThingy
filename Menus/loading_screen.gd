extends Node2D

@onready var preloader = $ResourcePreloader #essentially loads the scenes on a seperate thread
# Called when the node enters the scene tree for the first time.

func _ready():
	#if (GlobalVars.current_scene):
		#var instance = preloader.get_resource(GlobalVars.current_scene).instantiate()
		#add_child(instance)
	pass
