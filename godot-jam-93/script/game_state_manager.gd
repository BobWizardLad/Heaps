class_name EndlessGameManager
extends Node
## Script that mananges the game state of the endless mode. Catches 'died' signal from player to handle game over
## Manages game points and wave count and emits them to the UI

## Points the player has gained
var points: int
## The current wave count
var wave_count: int

## Signals to emit the current game state (points, waves)
signal points_changed(value: int)
signal wave_count_changed(value: int)

## Ensure game state is not paused
func _ready():
	get_tree().paused = false

## Update the player's points by value (additive)
func update_points(value: int):
	points += value
	points_changed.emit(points)

## Update the player's wave count by value (additive)
func update_wave_count(value: int):
	wave_count += value
	wave_count_changed.emit(wave_count)

## Pause the game
func process_game_over() -> void:
	get_tree().paused = true
