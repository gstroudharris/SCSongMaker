extends Node

var current_build_item: Resource = null

func _ready() -> void:
	current_build_item = get_tree().root.get_node("Main").current_build[0]
	print(get_child(0))
	replace_texture(current_build_item.item_image)
	
func replace_texture(input_texture):
	get_child(0).texture = input_texture
