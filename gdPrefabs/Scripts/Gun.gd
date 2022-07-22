extends MeshInstance


# Declare member variables here. Examples:
# var a = 2

# var b = "text"
export var default_position : Vector3
export var ads_position : Vector3
onready var anim = $AnimationPlayer
onready var ray = $"../RayCast"
export var ammo =  9
export var fullammo = 21
var rng = RandomNumberGenerator.new() 

func _ready():
	rng.randomize()
	var damage = rng.randf_range(1,35)
	return damage
# Called when the node enters the scene tree for the first time.
func _input(event):
	if Input.is_action_just_pressed("fire") and ammo != 0:
		anim.play("fire")
		 # Replace with function body.



func fire():
	$AudioStreamPlayer3D.stop()
	$AudioStreamPlayer3D.play()
	$AudioStreamPlayer3D.play()
	if ray.get_collider() != null and ray.get_collider().is_in_group("enemy") and ammo != 0:
		ray.get_collider().hp -= _ready()
		print(_ready())
	ammo -= 1
	
func reload():
		if Input.is_action_just_pressed("reload") and ammo != 9:
			ammo += fullammo 
			fullammo = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	reload()
