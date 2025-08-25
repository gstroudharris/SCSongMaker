extends Node

var currently_building_item: Resource = null
var item_queued: bool = false
var build_start_time = 0.0
var build_time = 0.0
var current_time = 0.0

@onready var text_display = get_node("%BuildingTitle")
@onready var icon_display = get_node("%QueueIcon")
@onready var queue_bar = get_node("%QueueProgress")

func _process(delta: float) -> void:
	get_current_time()
	if get_tree().root.get_node("Main").item_in_building_queue != null and item_queued == false:
		currently_building_item = get_tree().root.get_node("Main").item_in_building_queue
		text_display.clear()
		text_display.add_text(str(currently_building_item.item_display_name))
		replace_texture(currently_building_item.item_image)
		replace_and_track_progress(currently_building_item.item_build_time)
		item_queued = true
		
	if build_start_time + build_time >= current_time and item_queued == true:
		queue_bar.value = current_time - build_start_time
		
	else:
		#clear queue
		item_queued = false
		get_tree().root.get_node("Main").start_building_item(null)
		replace_texture(null)
		replace_and_track_progress(0.0)
		print(get_tree().root.get_node("Main").item_in_building_queue, )
			
func replace_texture(input_texture):
	icon_display.texture = input_texture

func replace_and_track_progress(input_build_time):
	queue_bar.max_value = input_build_time
	build_start_time = current_time
	build_time = input_build_time

func get_current_time():
	current_time = get_tree().root.get_node("Main").current_time
