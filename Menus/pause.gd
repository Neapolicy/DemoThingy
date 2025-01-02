extends Control

@onready var main = $"../../"


func _on_button_pressed():
	main.pause()


func _on_button_2_pressed():
	get_tree().quit()
