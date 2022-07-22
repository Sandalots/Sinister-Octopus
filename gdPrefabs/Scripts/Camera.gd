extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player
onready var cam = get_node(".")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#if self.name =="Camera":
		#if self.current == true:
			#if Input.is_action_pressed("rotateQ"):
				#cam.rotation.y +=0.05
			#if Input.is_action_pressed("rotateE"):
				#cam.rotation.y -=0.05
				pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
		# zoom in
			if event.button_index == BUTTON_WHEEL_UP:
				self.fov -=1
			# call the zoom function
		# zoom out
			if event.button_index == BUTTON_WHEEL_DOWN:
				self.fov +=1
			# call the zoom function


