extends CharacterBody2D

@onready var anim_player = $AnimationPlayer

func interact():
	Dialogic.start("door_open") #gets you out of the interaction mode
	anim_player.play("door_open")
	get_tree().change_scene_to_file("res://Menus/loading_screen.tscn")


func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "door_open"):
		Transition.transition()
		await Transition.on_finish
		anim_player.play("RESET")
