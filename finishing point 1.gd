extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	get_tree().change_scene_to_file("res://level_2.tscn")
	pass
	


func _on_tree_entered(body):
	
	if _on_body_entered(body): 
		get_tree().change_scene_to_file("res://level_2.tscn")
	pass # Replace with function body.
