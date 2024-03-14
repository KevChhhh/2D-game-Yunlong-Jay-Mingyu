extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var activated = false



func _on_area_2d_body_entered(body):
	if !activated:
		body.respawn_point = self
		activated = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
