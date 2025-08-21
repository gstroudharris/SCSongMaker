extends Node

@export var formatted_game_timer: String = ""

var game_timer: float = 0

@onready var text_display = get_node("%Timer")


func _ready() -> void:
	#var text_display = %Timer.text
	print(text_display)

func _physics_process(delta: float) -> void:
	game_timer = game_timer + delta
	format_time(game_timer)
	text_display.clear()
	text_display.add_text(str(formatted_game_timer))

func format_time(game_timer):
	var minutes = int(game_timer / 60)
	var seconds = int(fmod(game_timer, 60))
	formatted_game_timer = "%02d:%02d" % [minutes, seconds]
