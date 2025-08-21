extends RichTextLabel

@onready var text_display = get_node("%CurrentInput")

func _unhandled_key_input(event: InputEvent) -> void:
	text_display.clear()
	text_display.add_text(str(OS.get_keycode_string(event.key_label)))
