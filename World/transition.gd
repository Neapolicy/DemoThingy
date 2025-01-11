extends CanvasLayer

signal on_finish 

@onready var anim_player = $AnimationPlayer
@onready var color_rect = $ColorRect

func transition():
	color_rect.visible = true
	anim_player.play("fade")

func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "fade"):
		anim_player.play("fade_out")
		on_finish.emit()
	elif (anim_name == "fade_out"):
		color_rect.visible = false;
