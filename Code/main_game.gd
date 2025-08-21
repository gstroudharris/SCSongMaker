extends Node2D

var build_resource_item = load("res://Data/Protoss/WarpInStructure/unit_probe.tres")
var current_build: Array = [build_resource_item]
var current_build_item = current_build[0]
var hotkey_array_number: int = 0

var current_time: float = 0.00


func _unhandled_key_input(event: InputEvent) -> void:
	input_matcher(OS.get_keycode_string(event.key_label))

func input_matcher(input_key):
	if hotkey_array_number < current_build_item.hotkey_array.size():
		if input_key == current_build_item.hotkey_array[hotkey_array_number]:
			print("You hit the right key!")
			hotkey_array_number = hotkey_array_number + 1
	else:
		print("You win!")

func set_current_time(input_time):
	current_time = input_time
	#print(current_time)
