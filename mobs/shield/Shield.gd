extends Mob

onready var _cannon := $Cannon
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


func _prepare_to_attack() -> void:
	if not is_ready_to_attack():
		return
	_before_attack_timer.start()



func _on_BeforeAttackTimer_timeout() -> void:
	# The target might have exited the range while the timeout was running, so
	# we check again
	if not _target:
		return
	# Finally, we shoot.
	_cannon.shoot_at_target(_target)
	_cooldown_timer.start()
	
func _physics_process(delta: float) -> void:
	if not _target:
			return
	_cannon.look_at(_target.global_position)

	if _target_within_range:
			orbit_target()
			# We can call this on every frame, it's not a problem; if the
			# _before_attack_timer is already started, nothing will happen (on most
			# frames, this function does nothing)
			_prepare_to_attack()
	else:
			follow(_target.global_position)
