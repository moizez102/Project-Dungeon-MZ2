extends "res://spells/Spell.gd"

var can_shoot:bool = true

func _ready() -> void:
	_cooldown_timer.connect("timeout", self, "timeoutfu")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and can_shoot == true:
		shoot()
		can_shoot = false
		_cooldown_timer.start()

func timeoutfu():
	_cooldown_timer.stop()
	can_shoot = true
