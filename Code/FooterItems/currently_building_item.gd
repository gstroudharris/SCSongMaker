extends Node

var currently_building_item: Resource = null
var item_queued: bool = false
@onready var text_display = get_node("%BuildingTitle")
@onready var icon_display = get_node("%QueueIcon")
@onready var queue_bar = get_node("%QueueProgress")

func _process(delta: float) -> void:
	if get_tree().root.get_node("Main").item_in_building_queue != null:
		currently_building_item = get_tree().root.get_node("Main").item_in_building_queue
		text_display.clear()
		text_display.add_text(str(currently_building_item.item_display_name))
		replace_texture(currently_building_item.item_image)
		
		item_queued = true

func replace_texture(input_texture):
	icon_display.texture = input_texture
