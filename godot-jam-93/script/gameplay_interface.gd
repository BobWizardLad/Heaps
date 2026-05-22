class_name EndlessGameplayInterface
extends Control
## Controller for the game interface. Catches signals to update components of the 
## Interface as well as to play animations for transition screens

## Labels in the UI for different functions
@onready var points: Label = $MarginContainer/VBoxContainer/HBoxContainer/Points
@onready var wave_number: Label = $MarginContainer/VBoxContainer/HBoxContainer2/Wave
@onready var game_over: Label = $YouDied
## AnimationPlayer responsible for animating all UI elements
@onready var interface_player: AnimationPlayer = $InterfacePlayer
## Sound player for typewriter sfx
@export var typing_sfx: AudioStream

func update_points(value: int) -> void:
	points.text = str(value)

func update_wave_count(value: int) -> void:
	wave_number.text = str(value)

func trigger_game_over() -> void:
	interface_player.play("you_died")

func trigger_wave_clear_msg() -> void:
	interface_player.play("wave_clear")

func trigger_wave_start_msg() -> void:
	interface_player.play("wave_start")

func queue_typewriter_sfx() -> void:
	$SoundSequencer2D._queue_audio_track(typing_sfx)
