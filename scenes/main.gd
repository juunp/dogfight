extends Node2D


func _ready() -> void:
	var enemys = get_tree().get_nodes_in_group("enemy")
	for e in enemys:
		var enemy = e as Enemy
		enemy.shoot.connect(_on_shoot)

var Bullet = preload("res://scenes/enemies/bullet.tscn")

func _on_shoot(direction: float, location: Vector2)-> void:
	print("shoot listened")
	var spawned_bullet = Bullet.instantiate()
	add_child(spawned_bullet)
	spawned_bullet.rotation = direction
	spawned_bullet.position = location
	spawned_bullet.velocity = spawned_bullet.velocity.rotated(direction)
