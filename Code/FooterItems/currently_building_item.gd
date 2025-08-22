extends Node

var currently_building_item: Resource = null
@onready var text_display = get_node("%Timer")

func _process(delta: float) -> void:
	if get_tree().root.get_node("Main").item_in_building_queue != null:
		print("time to build!")
