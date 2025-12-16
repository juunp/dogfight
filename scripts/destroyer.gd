extends Enemy

@export var _max_angle : int =  -160
@export var _min_angle : int = -20
@export var frames_count := 5
@onready var canon: Polygon2D = $canon
var player: Player

func _ready() -> void:
	find_player()
	if player != null:
		canon.look_at(player.position)
	
func _process(_delta: float) -> void:
	if player == null:
		return
	if calculate_angle_to_player(player.global_position):
		canon.look_at(player.position)

func _on_timer_timeout() -> void:
	if player != null && can_shoot():
		shoot.emit(calculate_angle_to_player(player.global_position), canon.get_node("bullet_spawn").global_position)
		
func find_player():
	player = get_tree().get_first_node_in_group("player")

func can_shoot() -> bool:
	return calculate_angle_to_player(player.global_position)

func calculate_angle_to_player(player_position: Vector2) -> bool:
	var direction = player_position - global_position
	var angle = rad_to_deg(direction.angle())
	return angle < _min_angle && angle > _max_angle
	
