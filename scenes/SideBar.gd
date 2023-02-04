extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func updateUI(scene):
	
	find_node("turn").text = scene.currentState.nameState
	find_node("food").text = ("%s" %scene.food)
	find_node("people").text = ("%s" %scene.peopleCount)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
