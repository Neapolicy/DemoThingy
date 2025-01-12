extends CanvasLayer

@onready var main = $"../"

func _on_button_pressed():
	main.pause()


func _on_button_2_pressed():
	get_tree().quit()


func _on_return_pressed():
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
