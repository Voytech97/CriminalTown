extends CharacterBody3D

@export var speed = 2.0
@export var rotation_speed = 2.5
@export var gravity = 10.0
@export var bullet_scene = preload("res://Weapons/Bullets/Scenes/Bullet.tscn")

var rotation_direction = 0

@onready var camera = $Camera3D
@onready var muzzle = $Muzzle 
var camera_rotation

func _ready():
	camera_rotation = camera.global_rotation

func get_input():
	rotation_direction = Input.get_axis("ui_right", "ui_left")
	velocity = basis.x * Input.get_axis("ui_down", "ui_up") * speed
	
	if Input.is_action_pressed("Shoot"):
		shoot()

func _physics_process(delta):
	get_input()
	
	if not is_on_floor():
		velocity += get_gravity() * gravity * delta
		
	rotate_y(rotation_direction * rotation_speed * delta)
	move_and_slide()
	
	camera.global_rotation = camera_rotation

func shoot():
	var bullet = bullet_scene.instantiate()
	
	get_tree().root.add_child(bullet)
	
	bullet.global_transform = muzzle.global_transform
