extends Node2D

#load current build item resource attributes, so we can access build time, name, etc
var current_build_resource = load("res://Data/current_build_order.tres")
var current_build_array = [current_build_resource.current_build_array]
var current_build_item = current_build_array[0]
var current_item_attributes = current_build_item[0]


func _enter_tree() -> void:
	print(current_item_attributes.item_db_number," ",current_item_attributes.item_display_name," ",current_item_attributes.item_build_time)

var hotkey_array_number: int = 0
var current_time: float = 0.00


func _unhandled_key_input(event: InputEvent) -> void:
	input_matcher(OS.get_keycode_string(event.key_label))

func input_matcher(input_key):
	if hotkey_array_number < current_item_attributes.hotkey_array.size():
		if input_key == current_item_attributes.hotkey_array[hotkey_array_number]:
			print("You hit the right key!")
			hotkey_array_number = hotkey_array_number + 1
	else:
		print("You win!")
		

func set_current_time(input_time):
	current_time = input_time
	#print(current_time)
