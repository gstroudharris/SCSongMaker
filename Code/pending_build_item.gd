extends Node

var current_build_item: Resource = null

func _ready() -> void:
	current_build_item = get_tree().root.get_node("Main").current_build_item[0]
	#print(get_child(0))
	replace_texture(current_build_item.item_image)
	replace_name(current_build_item.item_display_name)
	
func replace_texture(input_texture):
	get_child(0).texture = input_texture

func replace_name(input_name):
	get_child(1).clear()
	get_child(1).add_text(input_name)
