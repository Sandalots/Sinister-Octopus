extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn") # Replace with function body.


func _on_Exit_pressed():
	get_tree().quit() # Replace with function body.
