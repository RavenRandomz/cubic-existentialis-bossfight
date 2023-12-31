extends StaticBody3D

@export var damage: float = 10
@export var pushback_force = 5
@export var stun_time: float = 0.1


func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_area_3d_body_shape_entered(_body_rid:RID, body:Node3D, _body_shape_index:int, _local_shape_index:int):
	if (body.has_method("damage") and (body is PhysicsBody3D)):
		body.damage(damage)
		if body.has_method("stun"):
			body.stun(stun_time)
	if (body.has_method("pushback")):
		body.pushback(_generate_pushback_force(body))

func _generate_pushback_force(body: PhysicsBody3D):

	# Imagine an arrow pointing from the center of the box to the colliding body
	var center = global_position
	var body_center = body.global_position

	var coord_difference: Vector3 = body_center - center 
	var push_direction: Vector3 = coord_difference.normalized()
	var push_vector = push_direction * pushback_force
	return push_vector
