extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hp = 35

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if hp <=0:
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
