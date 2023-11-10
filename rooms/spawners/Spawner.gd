class_name Spawner
extends Sprite



export(Array, PackedScene) var list := []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = null
	#spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
func spawn() -> void:
	if not list:
		return

	# Get a random scene resource from the list array.
	var random_scene_index := randi() % list.size()
	var scene: PackedScene = list[random_scene_index]
	
	if not scene:
		return
	var node: Node2D = scene.instance()
	
	get_parent().add_child(node)
	node.global_position = global_position
