extends Bullet
onready var sprite:Sprite = $Sprite
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _destroy():
	_disable()
	sprite.hide()
	$Particles2D.emitting = true
	_audio.play()
	

func _on_AudioStreamPlayer2D_finished() -> void:
	queue_free()
