extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const ADS_LERP = 20

export var camera_path : NodePath
export (PackedScene) var Bullet
var Camera : Camera

var fview = {"Default": 70, "ADS": 45}

var curHp : int = 10
var maxHpp : int = 10
var damage : int = 1

var gold : int = 0

var attackRate : float = 0.3
var lastAttackTime : int = 0

var moveSpeed : float = 5.0
var jumpForce : float = 10.0
var gravity : float = 15.0
var sprintSpeed = 0
var vel : Vector3 = Vector3()


onready var camera = get_node("CameraOrbit")
onready var attackRayCast = get_node("WeaponHolder/Sword/AttackRayCast")

# Called when the node enters the scene tree for the first time.
func _ready():
	camera = get_node(camera_path)


func _physics_process(delta):
	
	vel.x = 0
	vel.z = 0
	
	var input = Vector3()
	
	if Input.is_action_pressed("move_forward"):
		input.z += 1
	if Input.is_action_pressed("move_backward"):
		input.z -= 1
	if Input.is_action_pressed("move_left"):
		input.x += 1
	if Input.is_action_pressed("move_right"):
		input.x -= 1
	if Input.is_action_pressed("sprint"):
		sprintSpeed = 10.0
	else:
		sprintSpeed = 0.0
	input = input.normalized()
	
	var dir = (transform.basis.z * input.z + transform.basis.x * input.x)
	
	vel.x = dir.x * (moveSpeed + sprintSpeed)
	vel.z = dir.z * (moveSpeed + sprintSpeed)
	
	vel.y -= gravity * delta
	
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y = jumpForce

	vel = move_and_slide(vel, Vector3.UP)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("fire2"):
		camera.fov = lerp(camera.fov, fview["ADS"], ADS_LERP * delta)
	else:
		camera.fov = lerp(camera.fov, fview["Default"], ADS_LERP * delta)
	
	if Input.is_action_pressed("fire1"):
		$WeaponHolder/Sword/AnimationPlayer.stop()
		$WeaponHolder/Sword/AnimationPlayer.play("Hit")
		$WeaponHolder/Sword/AnimationPlayer.play_backwards("Hit")
		
		var b = Bullet.instance()
		owner.add_child(b)
		b.transform = $Model/Position3D.global_transform
		b.velocity = -b.transform.basis.z * b.muzzle_velocity
		
