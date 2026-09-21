extends CharacterBody3D

@export var speed = 2
@export var rotation_speed = 2.5

var rotation_direction = 0

@onready var camera = $Camera3D
var camera_rotation

func _ready():
	camera_rotation = camera.global_rotation

func get_input():
	rotation_direction = Input.get_axis("ui_right", "ui_left")
	velocity = basis.x * Input.get_axis("ui_down", "ui_up") * speed

func _physics_process(delta):
	get_input()
	rotate_y(rotation_direction * rotation_speed * delta)
	move_and_slide()
	
	camera.global_rotation = camera_rotation
