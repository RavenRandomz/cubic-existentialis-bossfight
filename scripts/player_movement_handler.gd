class_name PlayerMovementHandler extends Node

var _player:Player
var speed = 5
var jump_speed = 10

func _init (parent_player:Player):
	_player = parent_player

func controlled_translational_motion(direction):
	var velocity = direction * speed
	if direction:
		_player.velocity.x = velocity.x
		_player.velocity.z = velocity.z
	else:
		_player.velocity.x = move_toward(_player.velocity.x, 0, speed)
		_player.velocity.z = move_toward(_player.velocity.z, 0, speed)

func jump():
	if (_player.is_on_floor()):
		_player.velocity.y = jump_speed

func _gravity_pull(delta):
	if not _player.is_on_floor():
		_player.velocity.y -= _player.gravity * delta

func _physics_process(delta):
	_gravity_pull(delta)
