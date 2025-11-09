extends CanvasLayer


func _on_button_pressed() -> void:
	await Fade.fade_out().finished
	
	get_tree().reload_current_scene()
	
	STATE.reset()
	Fade.fade_in()
	
