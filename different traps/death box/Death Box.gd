extends Area2D


# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
	
#func _on_area_2d_body_entered(body):
	#if body.has_method("kill"):
		#body.kill()


 # Replace with function body.


#func _on_body_entered(body):
	#if body.has_method("kill"):
		#body.kill()
	#pass # Replace with function body.





func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.has_method("kill"):
		body.kill()
		get_tree().change_scene_to_file("res://death scenes/death off cliff.tscn") 
