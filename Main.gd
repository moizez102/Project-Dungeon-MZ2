extends YSort

# The list of possible rooms to spawn
export(Array, PackedScene) var rooms := []
# The number of rooms on the x-axis
export var grid_width := 2
# The number of rooms on the y-axis
export var grid_height := 2
# The size of each individual room. It's assumed that all the rooms in the
# rooms array have that size.
export var room_size := Vector2(13, 13) * 128

onready var _pause_screen := $UILayer/PauseScreen
onready var _music_player := $MusicPlayer

func generate_level() -> void:
	var last_room_index := (grid_width * grid_height) - 1
	var current_room_index := 0
	var RoomScene: PackedScene = rooms[randi() % rooms.size()]

	
	for x in grid_width:
		for y in grid_height:
			var room_position := Vector2(x, y)
			# ... all the code will be between those two lines
			var room: BaseRoom = RoomScene.instance()
			room.global_position = room_size * room_position
			add_child(room)
			if current_room_index == 0:
				room.spawn_robot()
				room.spawn_items()
			elif current_room_index == last_room_index:
				room.spawn_teleporter()
				room.spawn_mobs()
			else:
				room.spawn_mobs()
				room.spawn_items()
			if x == 0:
				room.hide_left_bridge()
			elif x == grid_width - 1:
				room.hide_right_bridge()
			if y == 0:
				room.hide_top_bridge()
			elif y == grid_height - 1:
				room.hide_bottom_bridge()
			current_room_index += 1




	# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize() # without this, we would get the same random numbers on each run
	_pause_screen.hide()
	#_music_player.play()
	generate_level()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
