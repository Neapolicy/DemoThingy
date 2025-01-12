extends CanvasLayer


func _on_button_pressed():
	GlobalVars.current_scene = "res://World/map.tscn"
	get_tree().change_scene_to_file("res://World/map.tscn")



func _on_button_2_pressed(): #quit
	get_tree().quit()
