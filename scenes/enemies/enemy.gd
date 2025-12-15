class_name Enemy 
extends Node2D

func get_next_position(player: Player, frames_count: int) -> Vector2:
	return player.global_position * player.speed * frames_count
	
