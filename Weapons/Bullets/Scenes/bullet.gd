extends Area3D

@export var speed = 15.0

func _physics_process(delta):
	global_position += global_transform.basis.x * speed * delta

func _ready():
	await get_tree().create_timer(2.0).timeout
	queue_free()
